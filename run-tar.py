import tarfile

def chmodx(tarinfo):
    tarinfo.mode = int('0755', base=8)
    return tarinfo

f = tarfile.open('stanstart-0.0.2alpha.tar.gz', 'w:gz')
f.add('h-config.sh', arcname='/stanstart/h-config.sh', filter=chmodx)
f.add('h-manifest.conf' , arcname='/stanstart/h-manifest.conf', filter=chmodx)
f.add('h-run.sh' , arcname='/stanstart/h-run.sh', filter=chmodx)
f.add('h-stats.sh' , arcname='/stanstart/h-stats.sh', filter=chmodx)
f.list()
f.close()

#rhminer.2.3
f = tarfile.open('replace_rhminer2.3_stanstart-0.0.2alpha.tar.gz', 'w:gz')
f.add('rhminer/h-config.sh', arcname='/rhminer/h-config.sh', filter=chmodx)
f.add('rhminer/h-manifest.conf' , arcname='/rhminer/h-manifest.conf', filter=chmodx)
f.add('rhminer/h-run.sh' , arcname='/rhminer/h-run.sh', filter=chmodx)
f.add('rhminer/h-stats.sh' , arcname='/rhminer/h-stats.sh', filter=chmodx)
f.add('rhminer/2.3/control' , arcname='/rhminer/2.3/control')

f.list()
f.close()