for i in {1..20} # 50 should be enough, increase/decrease as needed
do

cat > tmp-pv.yaml <<EOF
apiVersion: v1
kind: PersistentVolume
metadata:
 name: pv$i
spec:
 persistentVolumeReclaimPolicy: Recycle
 capacity:
   storage: 20Gi
 accessModes:
 - ReadWriteOnce
 hostPath:
    path: /tmp/data
    type: ""
 storageClassName: gp2
 volumeMode: Filesystem

EOF

mkdir -p PVDIR/pv$i
kubectl apply -f tmp-pv.yaml
done

