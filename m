Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921138;
	b=cAA2+2Y5G9YI6DdEzd8bLT/G9QFv03Cdywfm+jNWQfeaNEJnGgnANtcys86WJ+Hvu0FZ
	 xS9v2xIBD6wKw+0t4OggCNHSm0tNMLRs0DXf21nuKC8g2UJg4gcQYj+O8IRXaIp7bVo66
	 itKaR1hD9Z54jq7SSPUIhh8gI2o0XLH2Gc024AxNcvUkJMM2tvJC6b2WdvyDp4PD/1vLg
	 VgrSiI4Dvh9L7oA9fkv1IxIwkNAe/HOuUxJNHHiuIvomHv3iDj/LaM7W1C5xahVydVHXh
	 gGmeP+ECmkmCAwhO5o1RZA3CwUdNgz/n7QR0TCTfh32/vV6UaGhTL4Gsi99HxIwkPXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921138;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4K5blrLYfLp82cSpiJ6hRZQ4I2SrkaSacxfbxpQSysU=;
	b=o4sQwIEyIStbzkSOaUhNAHjiblLbcDfGhCIKHi+CI4odpYad56MixUrYeAovDojhLiby
	 gQoOQM5PK6sCriP884VW6vB7i5QxsmihF+/qq2iyJaeT3iB4IWs1ATUBKRyS/eCTCEm7P
	 euRVjCvE7y/zU931fRRU7Yh9LHLqeoZ2ixvzQMKOlif4FwooLzfgUFMRwbw5Eo1zfaHn6
	 02qvwoAFVSyGn/6eO2fbXVb7nY+PFi5CRdFs/Cy+eGiNZ9Yo9zkBLXry1tQ+/O9azNHMB
	 a1qwO7aisP2CfUSb0vwFL6uwH8jKg92rsPPplaGRU/j4vfQVdGo1iNXVmLh85lnB33g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y8wWi4mL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CnPyKJ2g;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A443606A329
	for <virtio-comment@lists.linux.dev>; Tue, 17 Nov 2026 13:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A443606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y8wWi4mL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CnPyKJ2g
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC207G4188038
	for <virtio-comment@lists.linux.dev>; Tue, 17 Nov 2026 13:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4K5blrLYfLp82cSpiJ6hRZQ4I2SrkaSacxfbxpQSysU=; b=Y8wWi4mLQwd3TFwK
	R0y2d3Ghqs+aMylYC1/EV5qERf+A0WW6BRuNqxSXAkg0hOO/DeVUh94SRYsqqOXw
	ETbeBKtfo80vM7EVSbigWZsNDvsb8NasvXdu1DAH4+bfRGcmOK45xigHewZKmg/d
	d7uLiJ9lH2U4sm2RKToxn3HNsmrcwgNYkZVDhJuwsR/kytNy7ftfCaC3jDQDxQbn
	jcy5xeKimIDarvcfmOVQOZdwFSTNNwtt4MoBNSrGD83smMcb/3dze22tE3oPD+20
	aV7eAlt9WTanYdp9pm0F++Q7hD/g7iuKgydpghVmNuKGygD8K4+i0A+SRs/LmZ0i
	NEO7TA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m0b873-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Tue, 17 Nov 2026 13:12:17 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-862a5ad18d0so3305888a34.3
        for <virtio-comment@lists.linux.dev>; Tue, 17 Nov 2026 05:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794921136; x=1795525936; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4K5blrLYfLp82cSpiJ6hRZQ4I2SrkaSacxfbxpQSysU=;
        b=CnPyKJ2gtKBU/HxzsE8BlSIuOBewBSHUZe7pNVTnXk5U/PcIou/vjkx7nxoOlFuBVt
         SRRxUgOQtZHhWOle/1y9u5pMc302bWgv0kfdeW43R26wQwptZUdh527bcadFXhmzEvPE
         tVk6olJ8Td/KRaEN2pIATGfG51N1SxOTOTTNWSnl13rUCJAspDLkhLBDvBpmixa/60hm
         CcAvviobvm6pliDOvFuCE+S+U91n6Fhu4uEWhlNtriP/lO9TPCNMkgn1u5JawhR1hlFF
         zV9BjDtJUKCMc28TYqsW5nBL1f7TQSynFTbKaRlRJ3VnUDEM8+BDCmBb+H4sCwR2/TXU
         YN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794921136; x=1795525936;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4K5blrLYfLp82cSpiJ6hRZQ4I2SrkaSacxfbxpQSysU=;
        b=2V8knlnsMjnD78c1BW7yzDmPUn5b/avxEsQGlR0MQ7k88xRF0WUdXrdYTpEm97vtdb
         oat1gJxE3leyuhCng97VhsFBsN15vXFff0JxdKW8QsV329vXwfqvC1lK8TslCBuaaYdf
         824sZ+DR0AbwsJFB+RfN+ViYouMp9LQVjdOOvuKny8XL11FVQ/P1//hG7tyhil97+uAp
         qPtybkpRm4E30W96h/OiRGiMV6hiuTCH11iZnIHpeCVRpY1s2ZClTwtS68d7Rf3D0aAd
         aiol+UAC7oy5w98hfw9MERHP0vfM0gPVoIr2gU3L9vVYW8smrVeFWcSXEOif0KYMUmfZ
         0qsQ==
X-Forwarded-Encrypted: i=1; AL+hErHDRdB8EQYqdjO7mAo/Ma6C+FN7ax8Hfto+KoIvTsR95o9ty9QQGBDkjRkidC2QVRoB4UP2Dl9HOn4d5h6Zsw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9/Cv7eJyuk+33F0Orn19Un7h75csaHkrbYHkVZK4NdeD9hIl5j
	a5UTaUb77qkZVGzBO1wZLoBejSwcEGphHEkzr/6z2NU2vhJs4l0vfqP7HtCrOSd0toeE6MfMbx6
	5IHKx6YYpNEthVX6UXaDZoPe7USRIZQRo/wjbBErKc/lNYiE2dL/tzOcmk55EhoUO/mQIgg==
X-Gm-Gg: AYBFou0VkLItXciUHiPtpTafcFKC0yw7e5ejBEyJL4oM2P6wig+VVXfl40lquDMKJ7J
	0+hswLY80UAQuV1h09yhQ0O2t54nR3QBAr+S0sBPwUupdmqTFpRuL2qCfbLHpjvOu2dUbSBxtrM
	aYxG4iEPL0s1XJBfksHwpITVapsVUB8lWX0MG3fKyA6NOiDpAsjw1Gxegc+N7RmaKK5B6j6+S6J
	6AEkmfwU8mn6NgkOtNO6KiRcKu2Wwg9E7TID5ksd4K6kKmhxYxNg5idDfgNNvA0biop+vetr7nO
	7T0h1Z/j1NQDUdihHbe7dTtO5sBoPq+62ClFTWX4q+HTQLKpL1x+oPXPtEMEdShiAJfPC0ATu7F
	SePsL1kugWZKCUcQ5SdPLEj7o+mAAGtFr3EtZbvCChVbWPMfebxGrtwMeMS1DExk1C63OW7D8fb
	cIxYXyelIkCNpjEzCC9Wz3qblYBwSjlQ==
X-Received: by 2002:a05:6820:2206:b0:70e:2d38:4b86 with SMTP id 006d021491bc7-71ab4fa06fbmr9692278eaf.16.1794921136295;
        Tue, 17 Nov 2026 05:12:16 -0800 (PST)
X-Received: by 2002:a05:6820:2206:b0:70e:2d38:4b86 with SMTP id 006d021491bc7-71ab4fa06fbmr9692260eaf.16.1794921135717;
        Tue, 17 Nov 2026 05:12:15 -0800 (PST)
Received: from [10.110.92.177] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862beb11508sm6382758a34.3.2026.11.17.05.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 05:12:15 -0800 (PST)
Message-ID: <df871f4d-5c56-41b9-83a7-d5831f2b23e1@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 21:12:10 +0800
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
Subject: Re: [PATCH v6 4/4] virtio-blk: Add inline encryption security
 considerations
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-dev@lists.linux.dev, virtio-comment@lists.linux.dev,
        stefanha@redhat.com, mgurtovoy@nvidia.com, parav@nvidia.com,
        ebiggers@kernel.org, neeraj.soni@oss.qualcomm.com
References: <20261027090945.185178-1-linlin.zhang@oss.qualcomm.com>
 <20261027090945.185178-5-linlin.zhang@oss.qualcomm.com>
 <20261110065058-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <20261110065058-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfXzeNPxs4fwfbm
 HIOvkisztJhHPyA0xHxfZWwA2+teBkkhqTE2eBnqHo3icQq5RVDmtPIWSJcW4Lgyy8jyFRYCkor
 sTLudYr6GtBlB9kfLVpuKaen9K1I3TY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MiBTYWx0ZWRfXzxlAN7SKa193
 ShuvLqMqrSYrZHGksNWKHoheTzL4RgXjiFiXMt2LcawASbBTX9jKh90FRE7Hi3qq12YFJxwk4G0
 4rR65WKqEJ72O5zuTnGIVCDHboRBJAslpYtOeq+P9t7nBQBW6PPewoCTaalidV24GKhzWJ1Y1IP
 8dL2CPr2odzFmnBfGZUN4xpAbg/kQmczJFny1vHP5YztRBUERdmknZglH8pdwfpZ1E3/hqidP5j
 kJhmeqlR3KtefZfdCRyoCdF0jxiSBerDMmPAPNBad2dUJ+P/YxOo6hDWa9TsOqaqFTL5opkBn36
 Q0lxH1DeMt33/bvcbqHsf1poO2lT+YxH+ZlUp2OCi7gQZ9qQvVvzx3NKyrR0XVsgVMVR2JUAgxe
 +ZjL174Bp6erYClhy6jESEi1Cdkd8BwWh1jfxSIZlCxdkMstWpO+11HXxVxs63EVtbQZ3d7/7r7
 tKII0H8noy8RXwyLJLA==
X-Proofpoint-GUID: WOASVVwxoQVbyS3YRkJv61g8fD6O_a7h
X-Proofpoint-ORIG-GUID: WOASVVwxoQVbyS3YRkJv61g8fD6O_a7h
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc52b1 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=hm7eBhRZyIYsvCQPfSgA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170052



On 11/10/2026 8:01 PM, Michael S. Tsirkin wrote:
> 
> Good start! Yet something to improve:
> 
> On Tue, Oct 27, 2026 at 02:09:27AM -0700, Linlin Zhang wrote:
>> Inline encryption protects the data stored on the backend storage, but
>> the device, and therefore the host, is able to read the buffers of both
>> the request virtqueues and the administration virtqueue.
>>
>> Describe the resulting exposure. The data of the requests is transferred
>> in plaintext, so inline encryption is not a means of keeping data
>> confidential from the host, whichever key type is used, and confidential
>> guests cannot rely on it for that.
>>
>> A raw key programmed into a keyslot is visible to the host. A
>> hardware-wrapped key prevents the raw key from being extracted, so that
>> the key can only be used through the device which wrapped it, but does
>> not prevent the host, which is able to send administration commands
>> itself, from using the key through the device.
>> The raw key imported by VIRTIO_BLK_ADMIN_CMD_CRYPTO_IMPORT_KEY and the
>> software secret returned by VIRTIO_BLK_ADMIN_CMD_CRYPTO_DERIVE_SW_SECRET
>> are also visible to the host.
>>
>> This patch adds no normative requirements.
>>
>> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/238
>> Signed-off-by: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
> 
> 
> This needs to be rewritten:
> - use terminology from spec (or standards linked to) do not make up your
>   own
> - address physical device implementations and software ones
> - specific recommendations lacking

Thanks for your comments!

I'd like to double confirm that, this comment is about the commit message, right?

Would you please help clarify about 'specific recommendations lacking'? do you mean
adding some recommendations when and how to use virtio_blk inline encryption? 

For instance, which key type is preferred? 

> 
>> ---
>>  device-types/blk/description.tex | 40 ++++++++++++++++++++++++++++++++
>>  1 file changed, 40 insertions(+)
>>
>> diff --git a/device-types/blk/description.tex b/device-types/blk/description.tex
>> index bbae9af..ca54e50 100644
>> --- a/device-types/blk/description.tex
>> +++ b/device-types/blk/description.tex
>> @@ -1994,6 +1994,46 @@ \subsubsection{Inline Encryption Administration Commands}\label{sec:Device Types
>>  NOT write key material or the derived software secret to the
>>  \field{command_specific_result}.
>>  
>> +\subsubsection{Inline Encryption Security Considerations}\label{sec:Device Types / Block Device / Device Operation / Inline Encryption Security Considerations}
>> +
>> +Inline encryption protects the data stored on the backend storage, for
>> +example against an attacker who obtains the storage medium on its own. It
>> +is not a means of keeping data confidential from the host: the device, and
>> +therefore the host, is able to read the buffers of both the request
>> +virtqueues and the administration virtqueue. A confidential guest, for
>> +example a guest whose memory is protected from the host by a confidential
>> +computing technology, cannot rely on inline encryption to keep its data
>> +confidential from the host, whichever key type it uses.
> 
> 
> Pls reword in terms of device/driver, not host/guest.
> "confidential guest" is also not a common term
> 
> E.g. "an untrusted device", "a driver that does not trust the device".
> You can give examples "e.g. as is common with
> confidential computing configurations".

ACK

> 
> this applies everywhere.
> 
>> +
>> +\begin{note}
>> +Inline encryption does not protect the data of VIRTIO_BLK_T_CRYPTO_OUT and
>> +VIRTIO_BLK_T_CRYPTO_IN requests from the host: that data is transferred in
>> +plaintext in buffers of the request virtqueues.
>> +\end{note}
>> +
>> +When \field{key_type} is VIRTIO_BLK_CRYPTO_KEY_TYPE_RAW, the key material in
>> +the \field{bytes} of struct virtio_blk_crypto_key_desc of a
>> +VIRTIO_BLK_ADMIN_CMD_CRYPTO_KEYSLOT_PROGRAM command is the plaintext key.
> 
> the plaintext key?

Yes, when the key type is VIRTIO_BLK_CRYPTO_KEY_TYPE_RAW, it's the plaintext key
populated from the driver to the device. 

Only when the the key type is VIRTIO_BLK_CRYPTO_KEY_TYPE_HW_WRAPPED, it's a
hardware-wrapped key populated from the driver to the device. 

> 
>> +Any software able to access the buffers of the administration virtqueue,
>> +such as the hypervisor, the device implementation or other software on the
>> +host, can therefore obtain the key, and decrypt the data encrypted with it
>> +at any time, including after the key is no longer in use.
> 
> what does it have to do with software, unclear.

Thanks for this point!

The security implication is not specific to software. What matters is access to
the administration virtqueue buffer: since a RAW key is transferred in plaintext,
any entity with access to that buffer can observe and retain the key material.

Reword it as the following:
  - When \field{key_type} is VIRTIO_BLK_CRYPTO_KEY_TYPE_RAW , the RAW key
    material in the \field{bytes} of struct virtio_blk_crypto_key_desc of a
    VIRTIO_BLK_ADMIN_CMD_CRYPTO_KEYSLOT_PROGRAM command is transferred in
    plaintext through the Admin VQ buffer. Therefore, any entity that can
    read that buffer can read the plaintext key material.

> 
>> +
>> +When \field{key_type} is VIRTIO_BLK_CRYPTO_KEY_TYPE_HW_WRAPPED, a
>> +VIRTIO_BLK_ADMIN_CMD_CRYPTO_KEYSLOT_PROGRAM command only transfers a key
>> +wrapped by the device, and the raw key material is not exposed in its
>> +buffers.
> 
> material?

The struct virtio_blk_crypto_key_desc except slot in it implies a key,
containing key_size, crypto_mode, key_type, key bytes and etc. The key
material here only means the key bytes content.

> 
> the considerations are same or different for different key types?
> pls structures the text to make it clear what applies to what.

ACK.

Yes. The security considerations are different for the two key types. I'll
restructure this section to discuss RAW and HW_WRAPPED keys separately and
make it explicit which considerations apply to each. The new structure is
most like that

  - For RAW key:
    representation
    security exposure
    applicable considerations
  - For HW_WRAPPED key:
    representation
    security property
    applicable considerations
  
  - Considerations for both

> 
> 
>> This prevents the raw key from being extracted, so that the key
>> +can only be used through the device which wrapped it. It does not prevent
>> +the host, which is able to send administration commands itself, from using
>> +the key through the device, for example by converting a long-term wrapped
>> +key it has observed with VIRTIO_BLK_ADMIN_CMD_CRYPTO_PREPARE_KEY and
>> +programming the result into a keyslot. Moreover, a
>> +VIRTIO_BLK_ADMIN_CMD_CRYPTO_IMPORT_KEY command carries the raw key in its
>> +\field{command_specific_data}, and the struct virtio_blk_crypto_sw_secret
>> +returned by a VIRTIO_BLK_ADMIN_CMD_CRYPTO_DERIVE_SW_SECRET command is
>> +visible in its \field{command_specific_result}, so these commands expose
>> +secrets to the host in the same way as raw keys.
> 
> 
> this seems to argue with itself about some kind of protection
> that maybe could be there but is not?

Thanks for your comments!

the file is encrypted by 2 keys - file name key and file content key - which are
derived from a class key.

When the class key is a HW-WRAPPED key, it means the key implied by the struct
virtio_blk_crypto_key_desc except its slot filed is a ephemeral wrapped key.

A long-term wrapped key can be generated by either
VIRTIO_BLK_ADMIN_CMD_CRYPTO_GENERATE_KEY command or
VIRTIO_BLK_ADMIN_CMD_CRYPTO_IMPORT_KEY command. 

Then using VIRTIO_BLK_ADMIN_CMD_CRYPTO_PREPARE_KEY command to get a ephemeral
wrapped key. 

   - the command VIRTIO_BLK_ADMIN_CMD_CRYPTO_IMPORT_KEY exposes plaintext of a
     class key to the entity that has access to the Admin VQ buffers as it needs
     a input key as the class key.

   - the command VIRTIO_BLK_ADMIN_CMD_CRYPTO_GENERATE_KEY returns a long-term
     wrapped key directly, so no key plaintext exposure in Admin VQ buffer.

   - the command VIRTIO_BLK_ADMIN_CMD_CRYPTO_PREPARE_KEY doesn't expose key
     plaintext in the Admin VQ buffers.

  - the command VIRTIO_BLK_ADMIN_CMD_CRYPTO_DERIVE_SW_SECRET returns a raw
    software secret key (plaintext) to the virtio block driver which is the
    key that Linux uses to derive the file name key.

So the most security way is using the wrapped key generated and derived via
GENERATE_KEY and PREPARE_KEY. Even though, there is still risk the DERIVE_SW_SECRET
command return the software secret in form of plain text.

I'll restructure this text and introduce the above clearly.

> 
> 
>> +
>>  \subsubsection{Legacy Interface: Device Operation}\label{sec:Device Types / Block Device / Device Operation / Legacy Interface: Device Operation}
>>  When using the legacy interface, transitional devices and drivers
>>  MUST format the fields in struct virtio_blk_req
>> -- 
>> 2.34.1
> 

