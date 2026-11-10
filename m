Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310473;
	b=Oye1+g+g5Xo98IJJK/TCMoh5FjILsnrn/JZwsoO71Wnbezz4MuJxQcm3yh/G7s4thtON
	 M6Jc8XaVRpXppVPD24ouvDqAsXHnx8EiMoPP+HljOGO4OjdyfgqhCwPdI64397fItrA/w
	 fU/jBbzERGP3c1HpEmW++btAAx2HVlDpMcvBhpBRtjmVA5Mr7RxsHpup4dRi57Qv78Qme
	 G7vJnfFVoZsTSQygPGVQ28j0ODOk+yYlrRaCYeALlBFlzs2p6WV/HchzMaKfZV5wYsemJ
	 ukEcGEMjraJvmyNqpXaP5Ho6VnlT8LDX4FRGc2KH2orjd5RcAQZaJt91cyX8uRwcOcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=N2RrdInhgyeVJm/IQppXSOIoap28k6YqZ5ZwNk7Uev0=;
	b=SrEZSMf/dwzJ9Y8b76e0XE6gf6+kEQ1W8XLHRSKBtryrLPx00dcUk+U4wFo+OTIvLjRO
	 yW7RQpcHNUIyHMBrTn5hI6PJdqX8s3wbCrBYH+vAseZsyT8HXiEY2UKSdF1cyc9ESAZkf
	 Ge6jBkC6BvqYAg5c9+tkJ9ijrEiAgGAtF/UBmFCEI2bWhPNcjInU9Y42bfaesTJZwwaSZ
	 jK+61j2fOaeKKOc3Yofio7AifuDBXrUcd9lmsHIlRCGyxBPdixxFzXSY8Xcz6oV5nyThl
	 kg+IR8ldmxwQdFyAt+BYT1r0Cr2+WLgow8P2Nj84RszPuZoev4EzWB6RqRtFXJvn+rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=flPNPfKS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JMk3+yLv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9E8606A321
	for <virtio-comment@lists.linux.dev>; Tue, 10 Nov 2026 11:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F9E8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=flPNPfKS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JMk3+yLv
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAGan2881256
	for <virtio-comment@lists.linux.dev>; Tue, 10 Nov 2026 11:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2RrdInhgyeVJm/IQppXSOIoap28k6YqZ5ZwNk7Uev0=; b=flPNPfKSadZYFRVO
	s/KVyk4kMjNYo8SSXus9gGsN1i9m0XhzRhm3/K2RuY3p9Pca3v0EIbNEo6z3Ashi
	1RkPBStkhnYU9qjWBR5J11d9Kc/HwEqgEsPh08E4icK5XTZdmghWo2VNM4Oa0TCr
	x1U84YKOPtLDx9heHr1Yjj04gt6Vv7Ct+jFHggq5X9HW48LQGMZvFtFhkyDmwX3R
	LgmgxO+nx3UMZADlz+JRxRYEdJZTCT1T8BxwwrfV9jrCkg6ck+eHabMyGVL+q8Bx
	XvY4u17VU/uDfMpGsgH9SgsbvWhjH2dZrKj1FZ4M9Rh4P/QRk39kJ0EElsGDtBYD
	DnVUjA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux849358-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Tue, 10 Nov 2026 11:34:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso4013041eec.1
        for <virtio-comment@lists.linux.dev>; Tue, 10 Nov 2026 03:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794310470; x=1794915270; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N2RrdInhgyeVJm/IQppXSOIoap28k6YqZ5ZwNk7Uev0=;
        b=JMk3+yLvbpifOxZhxLP+vpdjx317xEtT/D51zd7VND1+xltBqh3HXMZ8nex5ie6V0A
         gWx0leds5N35eIwAsoIR8ZzhhkjIy4NWqtbRjTyfz2NLiQH5CKQw1Noxh61eugswQtq/
         41P2SHeGFOTX2n788XTsWiu2XTy55C/j2eFsfpJQcjsWzOWoib0I98xML+tkOJLc+rdo
         1/KgHl6oGHRy8b10A3MWILg2phrKvDQVwc29z/B43IWaSUyyGDDv5sS62uhm7Z2rylSp
         eKDFIhd+oGlyPlrlrPiUfLGne4Pa1w9Qw+Z/J4EMQ1kC+JrR+vEuHRpLbZnCUJ7b5pzD
         znZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310470; x=1794915270;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2RrdInhgyeVJm/IQppXSOIoap28k6YqZ5ZwNk7Uev0=;
        b=eQvLQBrPfLBbp/w0W20EPSv0+rDG4suOtlu2IOxddiITJSp4CasEOdCfLqmX3c4Xge
         obyYk2WoC/IdIbgWKG/xFC6CAA2jhRco/vIoxImIzH0hYwkKum7kBeFdUtVNvSDm4FS2
         Z0hhHsxZTehfQsEVohmVNe+H9BDitZRyupq99OHLipThKne67f73XZGsT4USKXqBJT+H
         4wfJgL4Vrw/e0oUd1PnbVy72Gn/+Y4ew72JUa+UseIMPN0X+UgdUdaorCJuA/HIFDy3j
         QT7GZgqp1kArIYLwcAtj24lGrTmesAG9VwZ3//At/ItdnUBDwciEh727t+rB5h7Q9bfr
         aU9A==
X-Forwarded-Encrypted: i=1; AL+hErGm9ZKMgwpgnuU7YR8RdtCCoT4vsY7PsuKAv9KtU1UcFm9v2JJi1Mp4+oPqrjWEwSeJapQDeyWRTJ9Ky04mgQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/hn52spwclk18fM7WAg3KzZaLLSTpXm5MztDLedmhqOrrZJ1Js
	DYrW2qjqzF3sPtII5N+/LeGctW30v5HczD2msV55I+q4Fe4pOptAfXe3b0o/cHvxrRG4rxQUm5y
	ejg0tL9lMJ+Xut8QA3FSAeg7/8C4lZ/G+WQpO25n1Hspvh7yP15YjxNwTgIRuzjunxUDcvA==
X-Gm-Gg: AYBFou1MGEhywT1Hyfa5Vv5HIbzpf3kxz1wHkOTMxWx4eVEnBbjJ9DZrQAkJ0AJyKfl
	WAIqyrLatp2km4fRnJdrC8d+qMXWmkiqVloOcLRWkbuQyP/610tmXiE/YqhTpshmhfiw2csYvQo
	iBi1myZ/6OwcTkN66T7MyXldaJzLjFNWyZw1I1nb8mSZsTcrwH7nXesE6+kv0rjSdJZLdzubZD5
	tlhNOhLZghe7bcdcsn3wfdLBZweeS5Ur0OKnw+s5xBu4Xutn+opH373TRt57lOYRr0nBMiZb4sU
	TtnRHbLQPxqUoUbfXlLN9Ad3Ya/BLApa2OJlcjV/qyZVvxJa1vfKvkwdRDrzNaNnTu66a65fb93
	jyde5GZiPnc9fIXtGIwBiv61NiHyMSc7Bi7v6i3uBdTrQYv4pamrEl7u9MS0796CMU+Mxw/SRXa
	RODOGBIz84cCt6hBRgH+P8XDDV4yKLGmM=
X-Received: by 2002:a05:7300:e3a7:b0:374:c5cd:42cf with SMTP id 5a478bee46e88-3751fc2fb74mr2662982eec.35.1794310470380;
        Tue, 10 Nov 2026 03:34:30 -0800 (PST)
X-Received: by 2002:a05:7300:e3a7:b0:374:c5cd:42cf with SMTP id 5a478bee46e88-3751fc2fb74mr2662949eec.35.1794310469664;
        Tue, 10 Nov 2026 03:34:29 -0800 (PST)
Received: from [10.110.17.252] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ad6f11csm5765856eec.0.2026.11.10.03.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:34:29 -0800 (PST)
Message-ID: <ad33bea1-cd2e-4379-a150-7e7d5976f373@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 19:34:25 +0800
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] Add inline encryption support
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: virtio-dev@lists.linux.dev, virtio-comment@lists.linux.dev,
        stefanha@redhat.com, mst@redhat.com, mgurtovoy@nvidia.com,
        parav@nvidia.com, ebiggers@kernel.org
Cc: neeraj.soni@oss.qualcomm.com
References: <20261027090945.185178-1-linlin.zhang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261027090945.185178-1-linlin.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfXyYsfLRAjx/Ns
 fpSfeg5m2Sdz8esJ7oIwD77BDGZsBfCd9TrjYEcsWbrfYJWyld8yFaV5vxFgR0EwubrHGeIJgdJ
 HgObM3J2jFOUTI0E3L5n4Q2E1BiSjAYpTHX0Xa1md6KWOndIR0FpoCFCNvYCwWpdRU2PFECxu2c
 Ugb+16FAPxxkerAjmfdIuWzkS4VXuU5h9bZgcLHJTpy0ajr/h6YZ3KCyN9uTB2IoKhkWvy4Vq5c
 +7ib+LJ9MSroC+Eox2ddS22GOshYYQzv/HD19zRzWTw+dTbJqPebpEobCSchwNuwDDqSAHlzQrm
 0k7h8okQTfE9Z/CUMWTq+ZpLCd+hZH0acUeiLqn2DVsgUdmFE/KYqQSp1NJAJ9kCyXMUDTuJiJj
 wFKHnpe5q5tmb/yBs5ZVZKuBe/vd44Yml9xCAKEBe6SF2dBQflQUz8KRKHtzEdu1uxMBuh2rzxN
 InujuPaKsKuqEVnyQiQ==
X-Proofpoint-GUID: iw6UHCrDGakkEQ15WI-MDGpY-Kb8eTcK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NSBTYWx0ZWRfXwoplOb6hKrhr
 CKyq85eX7qY9CED21aD13Se/D2fg70Jz4PuUYbnKZbRLOc20mRZB192QgYNs35hjJ3nV1lJhQ6e
 DYO5snCoc47sTM0HVXCCz2tAMGVUAkg=
X-Proofpoint-ORIG-GUID: iw6UHCrDGakkEQ15WI-MDGpY-Kb8eTcK
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af30147 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=AnHlLwozOnVvmI4e6GkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100045

Hi all,

Gentle ping on this proposal.

Following the previous feedback on patch 3, I have updated the inline encryption key management interface to use the Admin VQ instead of a dedicated virtio-blk VQ.

Any further review comments or feedback on the proposed specification changes would be greatly appreciated.

Thanks,
Linlin

On 10/27/2026 5:09 PM, Linlin Zhang wrote:
> This series adds inline encryption support to virtio-blk, for devices
> backed by storage with an inline crypto engine, such as UFS or eMMC.
> 
> The device reports its capabilities in the configuration space: the
> number of keyslots, the maximum Data Unit Number (DUN) size and the
> supported key types (raw and hardware-wrapped). Keys are managed, and
> the supported crypto modes are discovered, with group administration
> commands of the Self group type, so the feature depends on
> VIRTIO_F_ADMIN_VQ. Encrypted reads and writes are still submitted on
> the request virtqueues; each of them identifies a programmed keyslot
> and carries a 256-bit DUN.
> 
> Patch summary:
> 1. Add the feature bit and the configuration fields
> 2. Add the administration commands to manage the keys and to query the
>    supported crypto modes
> 3. Add the encrypted request types
> 4. Describe what inline encryption does and does not protect against,
>    in particular for confidential guests
> 
> This series is independent of, but is intended to be used together
> with, the series adding administration virtqueue support to the MMIO
> transport:
> https://lore.kernel.org/all/20261017114556.1701355-1-parav@nvidia.com/
> 
> For background on inline encryption, see:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/block/inline-encryption.rst
> 
> The new administration command opcodes are allocated from 0x0013, not
> from 0x0012: the group administration commands table in the current
> specification lists 0x0013 - 0x7FFF as the range of commands using
> struct virtio_admin_cmd, so the new commands start at the first opcode
> of that range.
> 
> changes in v6:
>  - Remove the dedicated control virtqueue and VIRTIO_BLK_F_CTRL_VQ; use
>    group administration commands of the Self group type on the
>    administration virtqueue instead, with opcodes 0x0013 - 0x0019
>  - Change feature bit VIRTIO_BLK_F_INLINE_ENCRYPTION to 20
>  - Require VIRTIO_F_ADMIN_VQ to be offered with
>    VIRTIO_BLK_F_INLINE_ENCRYPTION
>  - Never offer VIRTIO_BLK_F_INLINE_ENCRYPTION together with
>    VIRTIO_BLK_F_ZONED, as the zoned write constraints do not guarantee
>    that I/O addresses are aligned to the encryption data unit size
>  - Widen max_slots to 32 bits, matching the 32-bit slot fields
>  - Only report the commands in VIRTIO_ADMIN_CMD_LIST_QUERY if the
>    device offers VIRTIO_BLK_F_INLINE_ENCRYPTION, and the
>    hardware-wrapped key commands only if the device supports
>    hardware-wrapped keys; fail VIRTIO_ADMIN_CMD_LIST_USE enabling them
>    if the feature has not been negotiated
>  - Define the long-term and ephemerally-wrapped forms of
>    hardware-wrapped keys, and which form each command takes and returns
>  - Do not program or evict a keyslot while requests using it are
>    outstanding
>  - Change struct virtio_blk_crypto_key_desc and struct
>    virtio_blk_crypto_key_blob to use variable-length arrays; the key
>    length is given by key_size, and buffer lengths follow the generic
>    administration command rules, except that a command fails if a key
>    would be truncated. Remove VIRTIO_BLK_CRYPTO_MAX_KEY_SIZE
>  - Empty all keyslots on device reset, and fail requests using an empty
>    keyslot with VIRTIO_BLK_S_IOERR
>  - Report a failed GENERATE_KEY with any status other than
>    VIRTIO_ADMIN_STATUS_OK; require a successful DERIVE_SW_SECRET to
>    return the whole software secret; KEYSLOT_EVICT ignores all fields
>    other than slot
>  - Add a 'Security Considerations' subsection
>  - Split the series into four patches
> 
> changes in v5:
>  - Change feature bit value of VIRTIO_BLK_F_CTRL_VQ and
>    VIRTIO_BLK_F_INLINE_ENCRYPTION to 20 and 21 respectively
> 
> changes in v4:
>  - Add a control virtqueue specific subsection for virtio block
>  - Move all control virtqueue request related to this new subsection
>  - Add the precise semantics, error codes, etc for the new control
>    virtqueue commands
>  - Move 'MUST' to the normative section
>  - Use c struct to describe control virtqueue request
> 
> changes in v3:
>  - Add a control virtqueue
>  - Move key program/evict/derive_sw_secret/generate/prepare/import to
>    the control virtqueue
>  - Add the driver and device requirements for the request in the control
>    virtqueue
>  - Extend DUN in crypto message to a fixed four-element array of 64-bit
>    fields
> 
> changes in v2:
>  - Remove virtualization-specific terminology
>  - Move MUST sentence to the device/driver normative section
>  - Add explicit rejection for CRYPTO request if IE feature bit
>    isn't negotiated
>  - Modify the support list of crypto modes and the definition of
>    the size of the crypto modes buffer
> ---
> 
> Linlin Zhang (4):
>   virtio-blk: Add inline encryption feature bit and configuration
>   virtio-blk: Add inline encryption administration commands
>   virtio-blk: Add inline encryption request types
>   virtio-blk: Add inline encryption security considerations
> 
>  admin.tex                               |  16 +-
>  device-types/blk/description.tex        | 827 +++++++++++++++++++++++-
>  device-types/blk/device-conformance.tex |   1 +
>  device-types/blk/driver-conformance.tex |   1 +
>  4 files changed, 835 insertions(+), 10 deletions(-)
> 

