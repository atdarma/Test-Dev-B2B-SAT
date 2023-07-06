from flask import Flask, jsonify, request, render_template
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:root@localhost/postgres'
db = SQLAlchemy(app)
CORS(app)


class Mahasiswa(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nama = db.Column(db.String(50), nullable=False)
    tgl_lahir = db.Column(db.Date, nullable=False)
    gender = db.Column(db.Boolean, nullable=False)
    id_jurusan = db.Column(db.Integer, db.ForeignKey('jurusan.id'), nullable=False)
    jurusan = db.relationship('Jurusan', backref=db.backref('mahasiswa', lazy=True))
    mahasiswa_hobi = db.relationship('MahasiswaHobi', backref='mahasiswa', lazy=True, cascade='all, delete')

    def to_dict(self):
        return {
            'id': self.id,
            'nama': self.nama,
            'tgl_lahir': str(self.tgl_lahir),
            'gender': self.gender,
            'id_jurusan': self.id_jurusan
        }


class Hobi(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nama = db.Column(db.String(50), nullable=False)
    mahasiswa_hobi = db.relationship('MahasiswaHobi', backref='hobi', lazy=True)

    def to_dict(self):
        return {'id': self.id, 'nama': self.nama}


class MahasiswaHobi(db.Model):
    id_mahasiswa = db.Column(db.Integer, db.ForeignKey('mahasiswa.id'), primary_key=True)
    id_hobi = db.Column(db.Integer, db.ForeignKey('hobi.id'), primary_key=True)


class Jurusan(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nama = db.Column(db.String(50), nullable=False)

    def to_dict(self):
        return {'id': self.id, 'nama': self.nama}

@app.route('/')
def index():
    return render_template('index.html')


@app.route('/mahasiswa', methods=['POST'])
def create_mahasiswa():
    data = request.get_json()
    mahasiswa = Mahasiswa(
        nama=data['nama'],
        tgl_lahir=data['tgl_lahir'],
        gender= data['gender'],
        id_jurusan=data['id_jurusan']
    )
    db.session.add(mahasiswa)
    db.session.commit()
    return jsonify(mahasiswa.to_dict()), 201


@app.route('/mahasiswa', methods=['GET'])
def get_mahasiswa():
    mahasiswas = Mahasiswa.query.all()
    mahasiswas_data = []

    for mahasiswa in mahasiswas:
        jurusan = Jurusan.query.get(mahasiswa.id_jurusan)
        hobi_ids = [mh.id_hobi for mh in mahasiswa.mahasiswa_hobi]
        hobis = Hobi.query.filter(Hobi.id.in_(hobi_ids)).all()

        mahasiswa_data = mahasiswa.to_dict()
        mahasiswa_data['jurusan'] = jurusan.to_dict()
        mahasiswa_data['hobis'] = [hobi.to_dict() for hobi in hobis]
        mahasiswas_data.append(mahasiswa_data)

    return jsonify(mahasiswas_data), 200

@app.route('/mahasiswa/<int:mahasiswa_id>', methods=['GET'])
def get_mahasiswa_by_id(mahasiswa_id):
    mahasiswa = Mahasiswa.query.get(mahasiswa_id)
    if mahasiswa:
        return jsonify(mahasiswa.to_dict()), 200
    return jsonify({'error': 'Mahasiswa not found'}), 404


@app.route('/mahasiswa/<int:mahasiswa_id>', methods=['PUT'])
def update_mahasiswa(mahasiswa_id):
    mahasiswa = Mahasiswa.query.get(mahasiswa_id)
    if not mahasiswa:
        return jsonify({'error': 'Mahasiswa not found'}), 404
    data = request.get_json()
    mahasiswa.nama = data['nama']
    mahasiswa.tgl_lahir = data['tgl_lahir']
    mahasiswa.gender = data['gender']
    mahasiswa.id_jurusan = data['id_jurusan']
    db.session.commit()
    return jsonify({
        'id': mahasiswa.id,
        'nama': mahasiswa.nama,
        'tgl_lahir': mahasiswa.tgl_lahir,
        'gender': mahasiswa.gender,
        'id_jurusan': mahasiswa.id_jurusan
    })

@app.route('/mahasiswa/<int:mahasiswa_id>', methods=['DELETE'])
def delete_mahasiswa(mahasiswa_id):
    mahasiswa = Mahasiswa.query.get(mahasiswa_id)
    if not mahasiswa:
        return jsonify({'error': 'Mahasiswa not found'}), 404

    # Delete associated MahasiswaHobi records first
    MahasiswaHobi.query.filter_by(id_mahasiswa=mahasiswa_id).delete()

    db.session.delete(mahasiswa)
    db.session.commit()
    return jsonify({'message': 'Mahasiswa deleted successfully'})

if __name__ == '__main__':
    app.run(debug=True)