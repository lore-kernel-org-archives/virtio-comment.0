Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD40C511221
	for <virtio-comment@lists.linux.dev>; Fri,  4 Sep 2026 20:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788553088; cv=none; b=fRMve2ChnV4XIyerH0jZF6gBfpaMzcA7DiO7x97wn3HKfEXz1O3Ntp6ZvEMHfTE95Re1yay/R572W+BphjA1aYLkHWnxvYoVRaKkKMl9Iw6iiaQ71ZykIXMizls6MfvmsRKQbbNxlScEUJVN9/g36Xuz16ZUuC1i16qBR4xMpzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788553088; c=relaxed/simple;
	bh=UraNvtiSSq9ZAoyYzCjgHrVLhKdTyG16PvkGIp/HK0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2KMY9yKuYjGE9UE6ujqh6IEpoq99pOWg+nRI97api0P3UW13pNVmVBtc5MIsPAD6Caia+RJ9XXe7x1ibzUvWvBEb9RUwBkmCvg+UnScdNpwfABzyU7MvNh4JxgIYOkIQLZs88tVay3hGyuvIjz/Jc0UNuaRNOaAfasOHRMvKfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=nftweHWN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fdyvGGU8; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="nftweHWN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fdyvGGU8"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3355A7A00F0;
	Fri,  4 Sep 2026 16:18:00 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 04 Sep 2026 16:18:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1788553080; x=1788639480; bh=Q4DGkLvg0S
	w8P4+Ug/F1KuM+u0AQuZvlmt2KOuzrbXA=; b=nftweHWNi26MKn95OfBkp9c1GX
	6uMfvaVeuZIzw6rYWZGFu+rNzmst2kn3V+paABtHcLw9YA1lBOxpEDCCVuowmmzg
	1ieAMgqlZKnmRKZWIAUdufypn2OylAAd0qHOqcBu0kwulvAiqvNEGeljxLkimqJR
	dgZZciXKFe8AfjkWYlpvgf2ztaMdzBCPc9dJZE6jZLOVJ30GxSNqysK5ir0qP37A
	jdB23ltQbFfXlJOJFyxpG1+DZ8dueb55t6lv8v3dklDhZ4M8ecUKyhglDpX54pQg
	0R33A9EWXOZ/gwFuC5tlQsm77oEKWxF7PxaWng0R79YT0ezGqizXbtMfDSvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788553080; x=
	1788639480; bh=Q4DGkLvg0Sw8P4+Ug/F1KuM+u0AQuZvlmt2KOuzrbXA=; b=f
	dyvGGU8LosUlH69PthotZ6ulE3Lf1eOnBTz0Q2fp+p2OL7NGMnFd7DiUOj4ySuRe
	x0x6x8WE/eHFSgkTWXD9YwiMYZF6QW2D+26PVATxg1eeW31G1ckBvwWjhMiVEVgm
	TipPQi4Bm+GHFANKVhWAwS4jceVjeMTdlclDUDSyYOBbMky8Pwg4PID/WwgVgMyf
	RqXipnG0dTrFy/uRBS37I6KYrYfKJmi2TaEwFWQWKbPIqMNRWwGnMKNDLobRTZWK
	cP6pQI+qUdgrrP3PPr6f3H1kFym0w86kVei8/POi8P2wGyhTsLENbEI5s+EdNZu3
	AZVjOrMke9eD5qEbW+RFA==
X-ME-Sender: <xms:dyebakg8RBIBsLxgxrGfRZUj2LiWy86O-n4wN7esiwa_uTXVr5amZw>
    <xme:dyebavk6Skpl6iFADwwW_bNe_bmZgKanpPm3GgEviFL26c8Ex2KsaBFjS6xzlTWQY
    _fWSEqagWV409Pk9TsFqf5B8z7culqjVwBrZ0HL5htjXqUvzP8a>
X-ME-Received: <xmr:dyebavumQCUtoCO03uFNJy_4MzQlez6bvutqOemBGsAxNKuzm089bbdKtj7DDgxHk-ytM8enq9Og8PhlmEW_F-UEQOuJeHTHVC0>
X-ME-Proxy-Cause: dmFkZTFi4jmMHuvOW46u1lbfwYtkW0u2waKlh4ca28t3CE1RBrukDrnTo/l9RZAj5oHiyK
    SPtl3A85c5hnO/A5D8DXV7RXpczgXSM7pXaNAArYVHDs85udtEbcclegg7fDgRbCHD5VcC
    paSFvlDoqOl1qMJziF5yADMe+jx8U9BjJ+ETf0bkgRF9dRfcr41IOaLESBXz072jyskTSM
    dGuryX7pIrSjhjbR95zgHhUdzIh5SbLzyT39LxvSJDFP2Yqy3ZrI0uZfiNVFMkuYWUEiM6
    S88TQwxoVd2YqpQXNUpR3iYj29E7yGsYyAHOwpaSD8q/NyaPg4JfgGY80+nA/6Lb88GMLu
    8QliVgZDSX/Vv2n73E35F2VJqmOVceu7rFQqqLPEbej8p+fkWHTmjVy3PW3LPTAu1ZFycH
    Cf7rNdPre8owG/rrJrEODUIysl3vWPlh6+z9IIfSDXILcbEShmye2rxiAqRFylAa8UHo10
    lU0KtMbymz2cyQGkERvaFfOuZOjaslPIgpLIATALxQHW0eCKpfurFZp5Z9PZIqUYyl+JJo
    fkUBsPrO26K2lGe+VeLW6mAb1xBKSR2ow56IXvk5cMw9ZxRgXkaA5VtGi6+Defey3BHGDQ
    coeIiBWYP4CHrf2QMHOdGRA/lyx78FDcxk+W+Zp+LaQUvpaEbd4QN77nOdXg
X-ME-Proxy: <xmx:dyebalZQfZl54JHtrxZaaqUbSLyE2HeBD5fdV1Yj4jG1HRg8rVQwYA>
    <xmx:dyebanCoUBXXpDPkP4Va4A1naVQ56AWV07mnZ5bT-of1IxESOQDiyA>
    <xmx:dyebat8NjgN4gDuVcnVGb0Zoug8K7TXo95AAqlV7Z71L2EEB56roHw>
    <xmx:dyebajQ-jRiM6b4_o3pFeJZFQvs8gJzp5ysQovg6wNE71y0zgcmSuQ>
    <xmx:eCebal9cUzjnypBvTar0BzGV79azhKTHW88Hpw3tGb6HeU1Cr_TmqaMy>
Feedback-ID: i001e48d0:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Sep 2026 16:17:57 -0400 (EDT)
Message-ID: <8d47c1b6-18ec-47d6-baf2-8a1d8c27de57@invisiblethingslab.com>
Date: Fri, 4 Sep 2026 17:17:55 -0300
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] virtio-gpu: add flag to negotiate always passing
 ctx_id to RESOURCE_CREATE_BLOB
To: Demi Marie Obenour <demiobenour@gmail.com>, virtio-comment@lists.linux.dev
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 Sergio Lopez <slp@redhat.com>, Parav Pandit <parav@nvidia.com>,
 dmitry.osipenko@collabora.com, mst@redhat.com,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Alyssa Ross <hi@alyssa.is>
References: <20260903021442.423274-1-val@invisiblethingslab.com>
 <20260903021442.423274-3-val@invisiblethingslab.com>
 <a5d79e14-0064-4941-9891-c71a9660cf5a@gmail.com>
Content-Language: en-US
From: Val Packett <val@invisiblethingslab.com>
Autocrypt: addr=val@invisiblethingslab.com; keydata=
 xm8EaFTEiRMFK4EEACIDAwQ+qzawvLuE95iu+QkRqp8P9z6XvFopWtYOaEnYf/nE8KWCnsCD
 jz82tdbKBpmVOdR6ViLD9tzHvaZ1NqZ9mbrszMXq09VfefoCfZp8jnA2yCT8Y4ykmv6902Ne
 NnlkVwrNKFZhbCBQYWNrZXR0IDx2YWxAaW52aXNpYmxldGhpbmdzbGFiLmNvbT7CswQTEwkA
 OxYhBAFMrro+oMGIFPc7Uc87uZxqzalRBQJoVMSJAhsDBQsJCAcCAiICBhUKCQgLAgQWAgMB
 Ah4HAheAAAoJEM87uZxqzalRlIIBf0cujzfSLhvib9iY8LBh8Tirgypm+hJHoY563xhP0YRS
 pmqZ6goIuSGpEKcW5mV3egF/TLLAOjsfroWae4giImTVOJvLOsUycxAP4O5b1Qiy+cCGsHKA
 nCRzrvqnPkyf4OeRznMEaFTEiRIFK4EEACIDAwSffe3tlMmmg3eKVp7SJ+CNZLN0M5qzHSCV
 dBBkIVvEJo+8SDg4jrx/832rxpvMCz2+x7+OHaeBHKafhOWUccYBLKqV/3nBftxCkbzXDbfY
 d02BY9H4wBIn0Y3GnwoIXRgDAQkJwpgEGBMJACAWIQQBTK66PqDBiBT3O1HPO7mcas2pUQUC
 aFTEiQIbDAAKCRDPO7mcas2pUaptAX9f7yUJLGU4C6XjMJvXd8Sz6cGTyxkngPtUyFiNqtad
 /GXBi3vHKYNfSrdqJ8wmZ8MBgOqWaaa1wE4/3qZU8d4RNR8mF7O40WYK/wdf1ycq1uGad8PN
 UDOwAqdfvuF3w8QMPw==
In-Reply-To: <a5d79e14-0064-4941-9891-c71a9660cf5a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/4/26 12:35 PM, Demi Marie Obenour wrote:
> On 9/2/26 22:14, Val Packett wrote:
>> virtio-gpu device backends typically use ctx_id to route commands to
>> different modules that implement distinct context types, e.g.
>> virglrenderer vs. cross-domain. Each module may require the blob
>> resources intented to use with it to be allocated through it as well.
>>
>> Currently, this happens for host-only and default blobs which are
>> allocated from a context-specific local blob_id (e.g. an image
>> requirements blob in cross-domain). For guest-only resources however,
>> existing software (both the Linux kernel and the rutabaga-gfx library
>> used by device backends to implement virtio-gpu) allocates those with
>> ctx_id == 0, which might be a different "default" context type from the
>> one the resource is intended to be used with, e.g. when both
>> virglrenderer and cross-domain are present, the socket buffers used by
>> cross-domain were processed by virglrenderer which happens to work
>> but does not actually make sense.
>>
>> Additionally we would like to support PRIME imported resources (udmabufs
>> or dGPU passthrough dma-bufs) being passed over cross-domain with the
>> CREATE_GUEST_HANDLE feature, which due to API constraints must also
>> perform the creation of a guest-only blob resource with ctx_id but
>> without blob_id.
>>
>> Unfortunately changing this without breaking backwards compatibility
>> requires a flag to negotiate the use of the "fixed" convention. Otherwise
>> new guest kernel + old rutabaga would result in the command failing due
>> to old rutabaga not expecting guest resources to be allocated w/ ctx_id.
>>
>> Signed-off-by: Val Packett <val@invisiblethingslab.com>
>> ---
>>   device-types/gpu/description.tex | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
>> index 64e8c4ddecc5..c0ff3f34ec1c 100644
>> --- a/device-types/gpu/description.tex
>> +++ b/device-types/gpu/description.tex
>> @@ -42,6 +42,9 @@ \subsection{Feature bits}\label{sec:Device Types / GPU Device / Feature bits}
>>   \item[VIRTIO_GPU_F_CREATE_GUEST_HANDLE (6)] guest-only blob resources
>>     may be created with the VIRTIO_GPU_BLOB_FLAG_CREATE_GUEST_HANDLE flag.
>>     Requires VIRTIO_GPU_F_RESOURCE_BLOB.
>> +\item[VIRTIO_GPU_F_BLOB_CTX_ID_FIX (7)] it is always safe to pass the
>> +  current context ID to VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB,
>> +  including for guest-only blobs.
>>   \end{description}
>>   
>>   \subsection{Device configuration layout}\label{sec:Device Types / GPU Device / Device configuration layout}
>> @@ -673,6 +676,12 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
>>   identified by the \field{blob_id}. The actual allocation is done via
>>   VIRTIO_GPU_CMD_SUBMIT_3D.
>>   
>> +If VIRTIO_GPU_F_BLOB_CTX_ID_FIX has been negotiated, the \field{ctx_id} of
>> +the \field{hdr} MUST always be filled in with the ID of the default rendering
>> +context associated with the current handle, if one exists. Otherwise, it MUST
>> +only be filled when the \field{blob_id} has been filled to create a resource
>> +from a rendering context local object.
>> +
>>   The driver MUST inform the device if the blob resource is used for
>>   memory access, sharing between driver instances and/or sharing with
>>   other devices. This is done via the \field{blob_flags} field.
> Should VIRTIO_GPU_F_CREATE_GUEST_HANDLE require VIRTIO_GPU_F_BLOB_CTX_ID_FIX?
> That could simplify drivers.

Yeah, you're right. They seemed orthogonal to me in terms of driver 
code, but that's just because I've decided to simply not support 
CREATE_GUEST_HANDLE actually working when BLOB_CTX_ID_FIX is not set :)

I'll write this in explicitly in v3, and add a check for it in the driver.

Thanks,
~val

