Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793092207;
	b=w9Cyle3gR+zbFVPXlGWCbCx8tJGL9SMPpziqgsQN5b6bkkiRAPPCq6CylBhYsKowU0s4
	 8Qkby8xRPqg3dqDPwzGBxJjLSi6C9u9ih3GmjHGund27SolUnClWu8m+aXra30Z/Ycory
	 CZCnf6ug10ImDRkjdZU16X0atlHOirCTCgBA+Zs6kgyR2Eshn1Z1jH0aJBUHTeV9+0j8h
	 fuQPJV2VGBgTby1cqBAkzKVmAykdanBwST+jFIhCLI9/AD9n+dCD1Z+F3UEfICQcLLFFW
	 OfxwGuE+0+2E+bzaKDZAXoxv3sgyj6aeXmTgjPJKkocO21178xSWUdNzjMrkC6p5Umg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092207;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rdAZ7SVYGg8dhp45XX8FKyoX2IMu6grZya3rbF/u1vQ=;
	b=1bu+EF+rEj7i8N3mhLkpsQ9L44G7GuBm+pJjnONAdGbAYf5hTAZQBYLeAoSXVgTYH86b
	 7+L345CXHZ4Ij47beG1VaTnMCoO8MEMxKvKEFxrBlUOGswR0DK5rsccty/J93uwXg70ah
	 gv/RgJRtDitXXb3TWqxOqyfsiWEVtUXM9QeJ/d0LEqhw81+GTZQCS//lIMmt/P+TVzutr
	 EHKsmkherQSVJuP/64cte5W1KYCVfukfralVykEq3suHCimry+taGNfmsOiQrPY4T5wC5
	 Ww2J4SYbOGqAWGedlW71HQfvO/oTIkjRL7zokh2kL/oMt8M/j+V8bZjaBlWqDgujX/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o9tT+WBb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTGnTLIr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA318606A324
	for <virtio-comment@lists.linux.dev>; Tue, 27 Oct 2026 09:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA318606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o9tT+WBb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eTGnTLIr
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8gc7w1709138
	for <virtio-comment@lists.linux.dev>; Tue, 27 Oct 2026 09:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rdAZ7SVYGg8
	dhp45XX8FKyoX2IMu6grZya3rbF/u1vQ=; b=o9tT+WBbVx9JOagjVPeO/sBxfqn
	inFRN3dVPiVXCI57bmfXzVuEyzBFLm/4a4OXFpZbnddUyVB0M0pn0JFHactasMbP
	cXXsruG8rP5fETtJo+kzZu5p021SsDD/lj9sZWHbVzw1i5VyDQDhqSZK/Z1pK4D7
	FgIAQutXo4WLSylvdNpdgseJQFe0L0EaE0HeIsMiFiPjr8Yw0k9odU85rOHj3SmT
	5y/YqQuSGcY3/d0vTj+KO8CBM9TE66IbslKk576SgdqzjnE6j0I7HPxVQ8dYiPPN
	bDazyWUYbe+RsGPiStRiajLDwoZ8+3Bo1mGwtZAjs/VDKu5IfenzzU1e+dQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xv257-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Tue, 27 Oct 2026 09:10:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adcb81f487so6296719a91.3
        for <virtio-comment@lists.linux.dev>; Tue, 27 Oct 2026 02:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793092205; x=1793697005; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rdAZ7SVYGg8dhp45XX8FKyoX2IMu6grZya3rbF/u1vQ=;
        b=eTGnTLIrLAcyy1INFJ7+nuijU+L7u6XLE62NAhN2v5g9INHmZtuwxuIUmB2RF7dmEX
         AdsV2luxhaHbatC5OFMomGLBKXdTLiFisDr6xn0+sPtC9fTnQJnFTPAQuPLOOGguwUki
         E5ARLtHOjBEW2HIfdqm8QVqKOOnH15GX7+o+qF+9Eo5rJhIq8O+ZNYLAT8/lWLvCxSCl
         xyWjdtt4VJnwAjHC7aN3YMHOYFT3F2UsXCzE8dbsZz4YBOxZV8G7FaXudjFYrERoyvSR
         QBkARZCA71G/dp/YpzfD3GmxdYvJG24Sbw1wAgSCraqUSUortEmyktJ+zuTB+RyoMw06
         HTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092205; x=1793697005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rdAZ7SVYGg8dhp45XX8FKyoX2IMu6grZya3rbF/u1vQ=;
        b=bJ3GCjHlklOcZWZJ5TbY2Pwd2vYQyHJ0yTYRt6soUD2UtVV5mDQaMPYUb+zCwVf5vi
         rlwgpuKAE7KW0V/Ihv+Zcd1jAe+Y/WiQ58spmO79kXjEZNL7hNYPzRMLdAq6dyZE6/yr
         vIs9iKYwEAGJZqEEEEW8j31Q3hMvqTuGiyw7Anwms35knXuBTkQU2byrFeioTtWzCDcY
         vCnr0+MwEVF0NaX1+k2MBGx2HPhXrDwgWQZPfy6nlfHxr2O5u9haJTkJwktZnP+OcLFi
         VqP0HYEl7Q+XqykEcU7iAUhSrAX1vqhS/3P4lvuoskJ7IYLm2EVn2nuWt9DRX7iv70zo
         6drA==
X-Forwarded-Encrypted: i=1; AKwUvBxIa+tdg0PmdMn0pD9bXrOzaLl1spVffZbrmF743uOKh5u52mrI+sWnrDN8Hs0d4Ilft0lmzk7iK0VPkZXNlg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIkYcMirPCSiTEDWdfPZh/xI3WHnIBpYJjbisvJtMN0qiJtd4uV
	XnXkAN4TvzLDjJFivaQMnZ0KBHMdYtYskFwnvbWZ782STMyUNbv44+cJBAhlLV1AgWM3JHlFdzl
	Zgyt688AXz00XQuprxBsY3oLxStFlfRfEJLOc0fQVPsGuDf8iNkah7micnXWE/4QWah/Yhw==
X-Gm-Gg: AYBFou0icFc1xljm8HuZJqMHIIeeANCorArCMQT31E/WaMoOxjQzFy+RF21rZhKSgGr
	ZpOFy60+GVg+u0TJjzUUi92E8KM6kXM5T+UhtWFL/UltzMj1OfcohI771Po4efyR8+MED92AEQr
	Q7Oyv51vN3+wKmOm8zmXyD9OweHsl+mPv2xdbSqiljcRLua7CIjm1BFkJTZxJrcasOHNNBMsrO6
	quEaBU8waDgCLsDeBAnjiO4Dxn821FQpnuij/3fjnf1i0x+ArFKrpYW7ag7WvDIRp+lD/ycs23i
	c/MXMBGuYX60/zkOEqsmPpyOMqSUJ59Q9SHcqcyoDKl+WvxP3G7JeVbXScJfcOiSA7P0neNKFFU
	Bg9Y0TG5QI+jecxRxREygencVoCtXa211ocA4kcOq/cxRhmCb4uXncGj4ZA==
X-Received: by 2002:a17:90b:1647:b0:3ac:b145:8f4 with SMTP id 98e67ed59e1d1-3adeae9c56bmr8293368a91.41.1793092204822;
        Tue, 27 Oct 2026 02:10:04 -0700 (PDT)
X-Received: by 2002:a17:90b:1647:b0:3ac:b145:8f4 with SMTP id 98e67ed59e1d1-3adeae9c56bmr8293333a91.41.1793092204195;
        Tue, 27 Oct 2026 02:10:04 -0700 (PDT)
Received: from u24-san1p10108.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404426c2sm2940522a91.7.2026.10.27.02.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:10:03 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: virtio-dev@lists.linux.dev, virtio-comment@lists.linux.dev,
        stefanha@redhat.com, mst@redhat.com, mgurtovoy@nvidia.com,
        parav@nvidia.com, ebiggers@kernel.org
Cc: neeraj.soni@oss.qualcomm.com
Subject: [PATCH v6 3/4] virtio-blk: Add inline encryption request types
Date: Tue, 27 Oct 2026 02:09:26 -0700
Message-ID: <20261027090945.185178-4-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027090945.185178-1-linlin.zhang@oss.qualcomm.com>
References: <20261027090945.185178-1-linlin.zhang@oss.qualcomm.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: y37sRvpvBs8qj7dn2xBHmUn4iTSon4kp
X-Proofpoint-GUID: y37sRvpvBs8qj7dn2xBHmUn4iTSon4kp
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6ae06a6d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=zq-q7EK_8_aqPgTxwnwA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNiBTYWx0ZWRfX7RBcehmF4Huj
 LAC8OxBiaBmctM+Xe5Af0TRgp6UOWkPscpRQ7KYu3DnWjgwg35oCB7s8k9z2+sQv8XO+VBbmSi1
 mc2JbNzD3shfTb3uTUzLs3RF8Kb828zGE4+eS1yxhDU0y+oedSU1i9XfdegGRrtWfD2hGID4llD
 V90dO7COBGv1gicrGLphb1UFjN070Xaf1M0LiWRfUFIxMRsjZgy3NOK/e27d6kn1GoJVVaxN9d2
 DaiYZVIFye98Pz6mjz1jaXqBN9CYsofImExNYZYyhYMBkaX+rroiv/SRC0iWk+tFkzQPlO5E1F1
 VwrEwDY+vhcDdXcmTZdnOd8sT6kUoeKyum+AHQBd57h3mdwuUuJZEGjN6Gca9zWsMUxthzp0Mdj
 COE+EUzAfGC/7Me/KEJIldDmELyh1t1ugHaK/3Z2EuywURndeSvKgb14uod50zZFQFoT/ZJCvou
 vWmqOcDAj+XC0O4iiIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNiBTYWx0ZWRfXwNwCIRhIDQpp
 Fm3FJIQZ0CTDjqrpxiZjSAk5z3Uco8zsyMgcJ38OlkX38goPa67lDMhUMOEF8IwtIvOvlInIt7Y
 nPIZ/OmeJ1G0AHp2wpLtnRWr9QTq1zQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270036

Keys can now be programmed into keyslots, but the driver has no way
yet to request that the data of a read or write is decrypted or
encrypted with one of them.

Add the VIRTIO_BLK_T_CRYPTO_IN and VIRTIO_BLK_T_CRYPTO_OUT request
types. They behave like VIRTIO_BLK_T_IN and VIRTIO_BLK_T_OUT, except
that the request header is followed by struct virtio_blk_crypto_msg,
which selects the keyslot and gives the 256-bit Data Unit Number (DUN)
of the first data unit of the request. The DUN is incremented by one
for each subsequent data unit.

As struct virtio_blk_crypto_msg is 40 bytes long, the data of these
requests start at offset 56 instead of 16.

Also allow VIRTIO_BLK_REQ_FLAG_OUT_FUA for VIRTIO_BLK_T_CRYPTO_OUT, as
for VIRTIO_BLK_T_OUT.

Driver requirements:
- Requests use a keyslot programmed by a successful KEYSLOT_PROGRAM,
  with no device reset and no other KEYSLOT_PROGRAM or KEYSLOT_EVICT
  for that keyslot made available since it completed, are aligned to
  the data unit size of its key, and use DUNs which fit in the DUN size
  of the key.
- A keyslot is not programmed or evicted while requests using it have
  been made available and not yet used by the device.

Device requirements:
- Requests which do not satisfy the above fail with VIRTIO_BLK_S_IOERR
  without accessing the storage or writing to the data.
- The DUN is incremented by one for each data unit, and a split request
  keeps the data unit alignment and the DUN sequence.
- All keyslots are emptied on device reset, while hardware-wrapped keys
  remain valid.
- The request types are rejected with VIRTIO_BLK_S_UNSUPP unless
  VIRTIO_BLK_F_INLINE_ENCRYPTION has been negotiated.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/238
Signed-off-by: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
---
 device-types/blk/description.tex | 184 +++++++++++++++++++++++++++++--
 1 file changed, 174 insertions(+), 10 deletions(-)

diff --git a/device-types/blk/description.tex b/device-types/blk/description.tex
index b85db2e..bbae9af 100644
--- a/device-types/blk/description.tex
+++ b/device-types/blk/description.tex
@@ -71,7 +71,8 @@ \subsection{Feature bits}\label{sec:Device Types / Block Device / Feature bits}
 
 \item[VIRTIO_BLK_F_REQ_FLAGS_OUT_FUA (19)] Device supports the
     VIRTIO_BLK_REQ_FLAG_OUT_FUA flag in the \field{flags} bitfield of the
-    \field{virtio_blk_req} structure for VIRTIO_BLK_T_OUT requests.
+    \field{virtio_blk_req} structure for VIRTIO_BLK_T_OUT and
+    VIRTIO_BLK_T_CRYPTO_OUT requests.
 
 \item[VIRTIO_BLK_F_INLINE_ENCRYPTION (20)] Device supports inline
     encryption: data written to or read from the device can be encrypted
@@ -393,7 +394,7 @@ \subsection{Device Initialization}\label{sec:Device Types / Block Device / Devic
 \item programming and evicting keys in the block device's keyslots
     through the administration virtqueue.
 \item submitting the keyslot index and Data Unit Number (DUN) per crypto
-    request to the device.
+    request to the device using struct virtio_blk_crypto_msg.
 \end{itemize}
 
 The driver MUST NOT negotiate VIRTIO_BLK_F_INLINE_ENCRYPTION without
@@ -583,8 +584,8 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 value is the bit index in the \field{flags} bitfield):
 
 \begin{description}
-\item[VIRTIO_BLK_REQ_FLAG_OUT_FUA (0) for VIRTIO_BLK_T_OUT requests] Force Unit
-    Access (FUA) flag.
+\item[VIRTIO_BLK_REQ_FLAG_OUT_FUA (0) for VIRTIO_BLK_T_OUT and
+    VIRTIO_BLK_T_CRYPTO_OUT requests] Force Unit Access (FUA) flag.
 \end{description}
 
 The \field{sector} number indicates the offset (multiplied by 512) where
@@ -991,6 +992,71 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 operation by setting the VIRTIO_BLK_S_ZONE_INVALID_CMD value in
 \field{status} of \field{virtio_blk_req} structure.
 
+The following requirements only apply if the VIRTIO_BLK_F_INLINE_ENCRYPTION
+feature is negotiated.
+
+In addition to the request types defined for devices without inline
+encryption support, the type of a request on a request virtqueue can be an
+inline-encrypted read (VIRTIO_BLK_T_CRYPTO_IN) or an inline-encrypted write
+(VIRTIO_BLK_T_CRYPTO_OUT):
+
+\begin{lstlisting}
+#define VIRTIO_BLK_T_CRYPTO_OUT   27
+#define VIRTIO_BLK_T_CRYPTO_IN    28
+\end{lstlisting}
+
+VIRTIO_BLK_T_CRYPTO_IN and VIRTIO_BLK_T_CRYPTO_OUT requests behave the same
+as VIRTIO_BLK_T_IN and VIRTIO_BLK_T_OUT requests respectively, except that
+the data in \field{data} is decrypted (for VIRTIO_BLK_T_CRYPTO_IN) or is to
+be encrypted (for VIRTIO_BLK_T_CRYPTO_OUT) by the inline crypto engine in
+the device backend storage using the key already programmed in the keyslot
+identified by the request, combined with the request's Data Unit
+Number (DUN). For this reason, VIRTIO_BLK_T_CRYPTO_IN and
+VIRTIO_BLK_T_CRYPTO_OUT requests use the following layout, which adds
+\field{crypto_msg} to carry this information:
+
+\begin{lstlisting}
+struct virtio_blk_req_crypto {
+        le32 type;
+        le32 flags;
+        le64 sector;
+        struct virtio_blk_crypto_msg crypto_msg;
+        u8 data[];
+        u8 status;
+};
+\end{lstlisting}
+
+\field{crypto_msg} has the following structure:
+
+\begin{lstlisting}
+struct virtio_blk_crypto_msg {
+        le32 slot;
+        u8 unused4[4];
+        le64 dun[4];
+};
+\end{lstlisting}
+
+\field{slot} is the keyslot index, in the range from 0 to
+\field{max_slots} - 1 of \field{enc_characteristics}. The device backend
+uses the key programmed into this slot together with \field{dun[4]}.
+\field{dun[4]} is a 256-bit unsigned Data Unit Number represented as four
+little-endian 64-bit elements, with \field{dun[0]} as the least-significant
+element. The device increments this 256-bit value by one for each successive
+data unit of the size specified by \field{data_unit_size_bits} in the
+struct virtio_blk_crypto_key_desc, propagating carries from each element to
+the next, while encrypting or decrypting the data of the request. Since
+\field{dun[4]} holds 256 bits, \field{max_dun_bytes} is at most 32.
+\field{unused4} is reserved.
+
+The size of \field{crypto_msg} is 40 bytes, so \field{data} of a
+VIRTIO_BLK_T_CRYPTO_IN or VIRTIO_BLK_T_CRYPTO_OUT request starts at offset
+56 of struct virtio_blk_req_crypto, instead of offset 16 for other request
+types.
+
+The remaining inline-encryption-related operations are group administration
+commands, sent on the administration virtqueue; see
+\ref{sec:Device Types / Block Device / Device Operation / Inline Encryption Administration Commands}.
+
 \drivernormative{\subsubsection}{Device Operation}{Device Types / Block Device / Device Operation}
 
 The driver SHOULD check if the content of the \field{capacity} field has
@@ -1009,8 +1075,8 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 A driver MUST set \field{sector} to 0 for a VIRTIO_BLK_T_FLUSH request.
 A driver SHOULD NOT include any data in a VIRTIO_BLK_T_FLUSH request.
 
-The length of \field{data} MUST be a multiple of 512 bytes for VIRTIO_BLK_T_IN
-and VIRTIO_BLK_T_OUT requests.
+The length of \field{data} MUST be a multiple of 512 bytes for VIRTIO_BLK_T_IN,
+VIRTIO_BLK_T_OUT, VIRTIO_BLK_T_CRYPTO_IN and VIRTIO_BLK_T_CRYPTO_OUT requests.
 
 The length of \field{data} MUST be a multiple of the size of struct
 virtio_blk_discard_write_zeroes for VIRTIO_BLK_T_DISCARD,
@@ -1089,6 +1155,51 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 
 \end{enumerate}
 
+The following requirements only apply if the VIRTIO_BLK_F_INLINE_ENCRYPTION
+feature is negotiated.
+
+A driver MUST NOT submit a VIRTIO_BLK_T_CRYPTO_IN or VIRTIO_BLK_T_CRYPTO_OUT
+request unless all of the following conditions are satisfied:
+
+\begin{itemize}
+\item \field{slot} identifies a valid keyslot in the range
+    [0, \field{max_slots} - 1].
+
+\item the keyslot identified by \field{slot} has been programmed with the
+    key to use by a VIRTIO_BLK_ADMIN_CMD_CRYPTO_KEYSLOT_PROGRAM command
+    which the device completed with VIRTIO_ADMIN_STATUS_OK, and since
+    that command completed, the device has not been reset and no other
+    VIRTIO_BLK_ADMIN_CMD_CRYPTO_KEYSLOT_PROGRAM or
+    VIRTIO_BLK_ADMIN_CMD_CRYPTO_KEYSLOT_EVICT command for that keyslot has
+    been made available.
+
+\item \field{data} is non-empty.
+
+\item (\field{sector} * 512) is aligned to the data unit size of the key
+    programmed in the keyslot identified by \field{slot}.
+
+\item the length of \field{data} is a multiple of the data unit size of
+    the key programmed in the keyslot identified by \field{slot}.
+
+\item the Data Unit Number (DUN) of every data unit covered by the
+    request is representable with the \field{dun_bytes} bytes in
+    struct virtio_blk_crypto_key_desc specified when the key in the
+    keyslot identified by \field{slot} was programmed.
+\end{itemize}
+
+The driver MUST NOT make a VIRTIO_BLK_ADMIN_CMD_CRYPTO_KEYSLOT_PROGRAM or
+VIRTIO_BLK_ADMIN_CMD_CRYPTO_KEYSLOT_EVICT command available for a keyslot
+while any VIRTIO_BLK_T_CRYPTO_IN or VIRTIO_BLK_T_CRYPTO_OUT request whose
+\field{slot} identifies that keyslot has been made available and not yet
+used by the device.
+
+For a VIRTIO_BLK_T_CRYPTO_IN or VIRTIO_BLK_T_CRYPTO_OUT request,
+\field{dun[4]} MUST specify the 256-bit DUN of the first data unit covered
+by the request.
+
+The driver MUST initialize \field{unused4} in struct virtio_blk_crypto_msg
+to zero.
+
 \devicenormative{\subsubsection}{Device Operation}{Device Types / Block Device / Device Operation}
 
 The device MAY change the content of the \field{capacity} field during
@@ -1135,10 +1246,10 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 
 \item\label{item:flush3} the VIRTIO_BLK_F_REQ_FLAGS_OUT_FUA feature was
   negotiated and the VIRTIO_BLK_REQ_FLAG_OUT_FUA bit in \field{flags} was set in
-  the write request (regardless of whether the VIRTIO_BLK_F_FLUSH or
-  VIRTIO_BLK_F_CONFIG_WCE features were negotiated, and regardless of the
-  current cache mode as expressed by the value of the \field{writeback} field in
-  configuration space).
+  the write request (VIRTIO_BLK_T_OUT or VIRTIO_BLK_T_CRYPTO_OUT, regardless of
+  whether the VIRTIO_BLK_F_FLUSH or VIRTIO_BLK_F_CONFIG_WCE features were
+  negotiated, and regardless of the current cache mode as expressed by the value
+  of the \field{writeback} field in configuration space).
 
 \item\label{item:flush4} a VIRTIO_BLK_T_FLUSH request is sent \textbf{after the write is
   completed} and is completed itself.
@@ -1330,6 +1441,59 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 handles VIRTIO_BLK_T_ZONE_RESET request for the zone range specified in the
 VIRTIO_BLK_T_SECURE_ERASE request.
 
+If the VIRTIO_BLK_F_INLINE_ENCRYPTION feature is not negotiated, the device
+MUST reject VIRTIO_BLK_T_CRYPTO_IN and VIRTIO_BLK_T_CRYPTO_OUT requests
+with VIRTIO_BLK_S_UNSUPP status.
+
+The following requirements only apply if the VIRTIO_BLK_F_INLINE_ENCRYPTION
+feature is negotiated.
+
+If a VIRTIO_BLK_T_CRYPTO_IN or VIRTIO_BLK_T_CRYPTO_OUT request satisfies any
+of the following conditions, the device MUST set \field{status} to
+VIRTIO_BLK_S_IOERR, MUST NOT read from or write to the storage, and MUST NOT
+write to \field{data}:
+
+\begin{itemize}
+\item \field{slot} does not identify a valid keyslot.
+
+\item no key is programmed into the keyslot identified by \field{slot}.
+
+\item \field{data} is empty.
+
+\item (\field{sector} * 512) is not aligned to the data unit size of the
+    key programmed in the keyslot identified by \field{slot}.
+
+\item the length of \field{data} is not a multiple of the data unit size
+    of the key programmed in the keyslot identified by \field{slot}.
+
+\item the Data Unit Number (DUN) of any data unit covered by the request
+    is not representable with the \field{dun_bytes} bytes specified when
+    the key in the keyslot identified by \field{slot} was programmed.
+
+\end{itemize}
+
+For encrypted reads and writes, the device MUST use the key programmed in
+the keyslot identified by \field{slot} and the request's \field{dun[4]} as
+the DUN of the first data unit covered by the request, and MUST obtain the
+DUN of each subsequent data unit by incrementing the 256-bit value by one,
+propagating carries from \field{dun[0]} through \field{dun[3]}. If the
+device splits the request, each sub-request MUST preserve data-unit-size
+alignment and use the 256-bit DUN obtained by incrementing the request DUN
+by the number of preceding data units.
+
+On a device reset, the device MUST empty all keyslots, so that no key
+programmed before the reset can be used after it, and MUST NOT invalidate
+the long-term wrapped and ephemerally-wrapped keys it has produced before
+the reset.
+\begin{note}
+The driver therefore has to program the keys again after a device reset
+before submitting VIRTIO_BLK_T_CRYPTO_IN or VIRTIO_BLK_T_CRYPTO_OUT
+requests that use them, but it can reuse the hardware-wrapped keys
+obtained before the reset to do so.
+\end{note}
+
+The device MUST ignore \field{unused4} in struct virtio_blk_crypto_msg.
+
 \subsubsection{Inline Encryption Administration Commands}\label{sec:Device Types / Block Device / Device Operation / Inline Encryption Administration Commands}
 If the VIRTIO_BLK_F_INLINE_ENCRYPTION and VIRTIO_F_ADMIN_VQ features are
 negotiated, the driver uses the administration virtqueue (see
-- 
2.34.1

