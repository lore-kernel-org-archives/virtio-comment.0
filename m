Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793092208;
	b=EiNbEzu/xFb/mvZ/G5gMShcaNjX3Jyc97l4vVpmyKJGkDsQB2m0UtDbJso181I8UuBHb
	 CiVyUnY8m7XWGNPerrQxBG+Tp7AMA9zCk2vOrCHYOFhSpJiOwD9kRVEqhaGertYqk+oeE
	 CM8xfwYwDIpuj2KsOSy7q8c13a+vUXaJBYQi6Z1/X4HBuOsVzRL90WY9wKrUeSRg/NDhI
	 MG5+uWpNBxEgi11lt5ckkNA8ujF4C1vTZCwgsNwBJlhJE9ZT2crcatAu2gicCUsnnYC0P
	 cGsY+fuHbxRMh/ZKKTjDfZJ9+bmYwL7e77ftyvN4RjTVluFk4iG/rcwdmAkIQTXD4Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092208;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sIUCxGvZmzrx7I982kD4WWaGxm+tB1Zcq4eyYtvnSQI=;
	b=nkTGCFVsZsvM9vC6EbdUlF4csBWH499dfsziGKmE23ISE6NOhT2yg8P/BKAhJwo+jk7e
	 M3ln1CWVbkQ3oVN9Jk8OYiWIv6GJpNmfZYDdSnwWjwCkh7EbsCwKzc7l1gpaP83BSi+0p
	 hX4XSM3Gm8J8VbVv+WCjTQ72+aNTk2jQVOznexEFbfFEnHOHmztElrzFNXecVCx9vEtsr
	 Pf56RznsdzDy+wuO4WcrXGoxJ+tVWBhzFrdCH8a7eM46HldMHoxC/vb9snU6RK+BXwGPb
	 qFQs3wG2SXqYGNl0CE08CP/ulsOapttFtH0w4K6W0NOtwqzfU0b4r+Fty8CJIyr/o9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d+QELyb6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OnbxKIQ0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5EA606A326
	for <virtio-comment@lists.linux.dev>; Tue, 27 Oct 2026 09:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E5EA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d+QELyb6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OnbxKIQ0
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8gF2W2761222
	for <virtio-comment@lists.linux.dev>; Tue, 27 Oct 2026 09:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sIUCxGvZmzr
	x7I982kD4WWaGxm+tB1Zcq4eyYtvnSQI=; b=d+QELyb6wubsg/5AQ+Dsl9iamns
	S854763vP+q46opVgNe53bwfxAJ86Lk0M6aP5P/i5bLswlU0eyz5c5TukbfUpRPS
	MtH9wTCiK60t/XmZKj+RXzNAaa05um63IuWlHrX1nwpGBubf5VHc0QCXEbtCBVY8
	4hXlSGmYkp3mdhdCGvRWa6I1lR81sMqb/DgZ7VejKXOaNQN2QjCr6FWqPgg7ZCBr
	RnmYZK8mEyMxSRBojzc6IktGBwo3EaFudcabmtCY2XsYr+fzLNcpoMIzntmuqsgr
	JRWxs4oObc/yNrUBy+PuGSsnfesdisL1fj021TrqFrI5zhWc7EdtkR5ffVw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh919pau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Tue, 27 Oct 2026 09:10:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ada6ccd402so3425339a91.2
        for <virtio-comment@lists.linux.dev>; Tue, 27 Oct 2026 02:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793092207; x=1793697007; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sIUCxGvZmzrx7I982kD4WWaGxm+tB1Zcq4eyYtvnSQI=;
        b=OnbxKIQ0eNvy98HsvnIbrGFX4ROCkFiPtCd3jxOMSnf9PymXFIWf/4nrt9P0pgb/Y9
         kH0IkYAwuuf2d8QuHBL9zdIHksCJu2Q+r79byvr47YW0rMGGKWX7aFC9kU+uaLsVkJya
         pXXyw/5lIulhRkhogkjnokE2gz9PC8IWldaMVlqwXPuDM6aQtuyCpkI3W7emncvT0AAf
         KA7FaIXAkz1hLf5cCAL1oeztsmwM5ekbQvrmMxF/rj++z58U8aW8ZoofF9moFfmRPRfe
         sxPXtYlcVO+1Vx8BOSbSPnkr3+smcdF6FggGzJKdk56caETp9EmJgocEBRfSV+YdsAvn
         kROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092207; x=1793697007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sIUCxGvZmzrx7I982kD4WWaGxm+tB1Zcq4eyYtvnSQI=;
        b=X0KoovELRn00oiQdUmFs62SUXlguZD/mBzqRzFrJ2huksBileQeStqBsBkvvML+cqj
         1CVtPiZuZ9v7quC+js7Gy+jWTDxuogp655TRIbHllHyY0tO5mR+rGcUohHiKr3b+xLcb
         FYWCfQ+1M97IFIovCvil6Oa+l4XRt/pmaWmqUqUZMd80k9s6bUWwe0fp7lNlQa/hkBpr
         meRe36P7HXL5/nIncKsJN26es5xfpk2uDgDz9K42hKtzC72WavaDvRp32Zoce+6FN6bU
         8XIX9y94eTB9zzoVBF1Fvkkq5FC5HZHlgMTjVVjgGiDv21p49/wOInqO7a7uPrbrQyBP
         4RKQ==
X-Forwarded-Encrypted: i=1; AKwUvByfzh7wqaIZeNaVWFX8305xO4ZGUv37sjRscp9RlODZ3sQuwUJqkBsu8XqaxZSHv0Ft82sTjYiW4nMowFWlWQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYI4EGCNnmmzZkm/WFmA3kMfSYFkUbLr6Wmlg81DJsUbuj/RSk9e
	GTbF3xPa+4n9Bzoh1N7PSxBLYAUrYdjC/8Yzc9cM7ltWZllNAJu7uYDZZkxzucAdPRkUSSaWi4N
	0B3nP2AhTNE/+lsTPLiuCjtEK1D+DeFiuBgJzxL4lg9wkvux0nVO5aZd/3KYaqyTWxIznTA==
X-Gm-Gg: AYBFou0lC90hhfQ+s+ov2p7S1S/xuKCfm3L2q8D1O6lgqiKn10fICkFD7YfoW0+PSav
	yHGqwYjc5Z7suwPFZZSazdZOAIP+fUbcfd898D5X2w5zvufAOIeJlJjqvbvD0HFeEgoaK+k8TLH
	lE2nWjdh4BMgaSAwz+AoY94w88avUNf2IrRySfetBeDJaFxBiXvVkc45VmyaH6gXIkB76CXHtCl
	UO3eQvhN5lpKMLM3/JMKfDE91C1GR4Egzt6A1EAn0u9PqHUvwmvibYxR90geZG4xhfUuh1XZSCc
	sZVoYoZSowKNRl7xwSl81Upr9cKDFghiLWimtxttmIh/OVowkDpNJJKxCd4DfkSlDRVctvuhpXw
	gLU9icw6uFj8YASTxZNGH8bE63HwELtKwgYuBDSxA059q5z6bi4P7DKgKvw==
X-Received: by 2002:a17:90b:4a49:b0:3ab:188b:c5bc with SMTP id 98e67ed59e1d1-3adea8984afmr7332705a91.14.1793092206415;
        Tue, 27 Oct 2026 02:10:06 -0700 (PDT)
X-Received: by 2002:a17:90b:4a49:b0:3ab:188b:c5bc with SMTP id 98e67ed59e1d1-3adea8984afmr7332682a91.14.1793092205900;
        Tue, 27 Oct 2026 02:10:05 -0700 (PDT)
Received: from u24-san1p10108.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404426c2sm2940522a91.7.2026.10.27.02.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:10:05 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: virtio-dev@lists.linux.dev, virtio-comment@lists.linux.dev,
        stefanha@redhat.com, mst@redhat.com, mgurtovoy@nvidia.com,
        parav@nvidia.com, ebiggers@kernel.org
Cc: neeraj.soni@oss.qualcomm.com
Subject: [PATCH v6 4/4] virtio-blk: Add inline encryption security considerations
Date: Tue, 27 Oct 2026 02:09:27 -0700
Message-ID: <20261027090945.185178-5-linlin.zhang@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: KRtAIsRcgsLFFs6ElvaSxVLIPn6peXy_
X-Proofpoint-GUID: KRtAIsRcgsLFFs6ElvaSxVLIPn6peXy_
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae06a6f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=NsdwARnllhIqxsrLOxIA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNiBTYWx0ZWRfX0sLapgtpQXaf
 HTg2tCdfeaTIb8ZnQ/bxaUOpceVdlE3z+QTaPrXwJZp5IDkXe294ab73hfZd3FzdseC0KW4NYtP
 KXu7lEyEPs80/iUaygoYwI1I6kU+Kd/1QzjTB5oGm0Fm9K2YPd6IHDilBv4jxwy8NbcFYDTZdrn
 xAVJYIQpAzLL+EFwyYlgg6i1sR6+B42EzZdJvQGzUzp7p6i3uPKoC7ihZ3gkLlimU4HAIg6mhUS
 xZmiIdkDRyFxroNEycukMSeEx2EvrkU4NyVK5NY2MnS+ktGImeNz/NFM5xQGyD/+APcgaFjtLyp
 5VeohSUjxFS0me09D+5VVWjYA5c3gHZXuEqzLvPJfKWBNm7SkUtJOEP7ho6pDUmF1flkKtbH+R8
 Z7eX82cAByB6RgpDBLV7vu5yVslwV6E/vu25ED+ylQQijy5/BkIJ7+BuqxLHntymQ8jJtZmmKIf
 ozPyz3YgRBfPDlGmaVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNiBTYWx0ZWRfX/AkFRTffwvGp
 dh7sQ+pZAzu3VTmyU3RtkgfaH38Txyr7grGn7qL3xP8rzJmvQoXAYAmDNXZaCnyQFzfC8SsdDfC
 dVd79KxhhFgF/gXs0o88GAFzzbBkQQE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270036

Inline encryption protects the data stored on the backend storage, but
the device, and therefore the host, is able to read the buffers of both
the request virtqueues and the administration virtqueue.

Describe the resulting exposure. The data of the requests is transferred
in plaintext, so inline encryption is not a means of keeping data
confidential from the host, whichever key type is used, and confidential
guests cannot rely on it for that.

A raw key programmed into a keyslot is visible to the host. A
hardware-wrapped key prevents the raw key from being extracted, so that
the key can only be used through the device which wrapped it, but does
not prevent the host, which is able to send administration commands
itself, from using the key through the device.
The raw key imported by VIRTIO_BLK_ADMIN_CMD_CRYPTO_IMPORT_KEY and the
software secret returned by VIRTIO_BLK_ADMIN_CMD_CRYPTO_DERIVE_SW_SECRET
are also visible to the host.

This patch adds no normative requirements.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/238
Signed-off-by: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
---
 device-types/blk/description.tex | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/device-types/blk/description.tex b/device-types/blk/description.tex
index bbae9af..ca54e50 100644
--- a/device-types/blk/description.tex
+++ b/device-types/blk/description.tex
@@ -1994,6 +1994,46 @@ \subsubsection{Inline Encryption Administration Commands}\label{sec:Device Types
 NOT write key material or the derived software secret to the
 \field{command_specific_result}.
 
+\subsubsection{Inline Encryption Security Considerations}\label{sec:Device Types / Block Device / Device Operation / Inline Encryption Security Considerations}
+
+Inline encryption protects the data stored on the backend storage, for
+example against an attacker who obtains the storage medium on its own. It
+is not a means of keeping data confidential from the host: the device, and
+therefore the host, is able to read the buffers of both the request
+virtqueues and the administration virtqueue. A confidential guest, for
+example a guest whose memory is protected from the host by a confidential
+computing technology, cannot rely on inline encryption to keep its data
+confidential from the host, whichever key type it uses.
+
+\begin{note}
+Inline encryption does not protect the data of VIRTIO_BLK_T_CRYPTO_OUT and
+VIRTIO_BLK_T_CRYPTO_IN requests from the host: that data is transferred in
+plaintext in buffers of the request virtqueues.
+\end{note}
+
+When \field{key_type} is VIRTIO_BLK_CRYPTO_KEY_TYPE_RAW, the key material in
+the \field{bytes} of struct virtio_blk_crypto_key_desc of a
+VIRTIO_BLK_ADMIN_CMD_CRYPTO_KEYSLOT_PROGRAM command is the plaintext key.
+Any software able to access the buffers of the administration virtqueue,
+such as the hypervisor, the device implementation or other software on the
+host, can therefore obtain the key, and decrypt the data encrypted with it
+at any time, including after the key is no longer in use.
+
+When \field{key_type} is VIRTIO_BLK_CRYPTO_KEY_TYPE_HW_WRAPPED, a
+VIRTIO_BLK_ADMIN_CMD_CRYPTO_KEYSLOT_PROGRAM command only transfers a key
+wrapped by the device, and the raw key material is not exposed in its
+buffers. This prevents the raw key from being extracted, so that the key
+can only be used through the device which wrapped it. It does not prevent
+the host, which is able to send administration commands itself, from using
+the key through the device, for example by converting a long-term wrapped
+key it has observed with VIRTIO_BLK_ADMIN_CMD_CRYPTO_PREPARE_KEY and
+programming the result into a keyslot. Moreover, a
+VIRTIO_BLK_ADMIN_CMD_CRYPTO_IMPORT_KEY command carries the raw key in its
+\field{command_specific_data}, and the struct virtio_blk_crypto_sw_secret
+returned by a VIRTIO_BLK_ADMIN_CMD_CRYPTO_DERIVE_SW_SECRET command is
+visible in its \field{command_specific_result}, so these commands expose
+secrets to the host in the same way as raw keys.
+
 \subsubsection{Legacy Interface: Device Operation}\label{sec:Device Types / Block Device / Device Operation / Legacy Interface: Device Operation}
 When using the legacy interface, transitional devices and drivers
 MUST format the fields in struct virtio_blk_req
-- 
2.34.1

