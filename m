Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57E014D708
	for <virtio-comment@lists.linux.dev>; Thu, 26 Dec 2024 11:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735211405; cv=none; b=B7s2AxQw0jVNNiCnRZwftr4LCOxi0DDvJnbDVBKZmd8YAxdhkWDdnbQ9aPtJpYAFc5n8ZMc265iSn3QkNJg7CRjDkfvIgGaRWF08uVsaP3Uwkb7Q8TnjWLf+QRssQZZxBQ8sHyXdLsY/8JyuqtVIraXAlBPpPxAxx9VhJSQtH4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735211405; c=relaxed/simple;
	bh=AmIhNE2R8dOmt7fhIxSA1kvTAjefKVLcA/AiqbjFv90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XzHzZZHvXICYuID4xjPOFK7t1bunh7xF9Vlm4MdYcusH6W46dvQy+UWopGRcAFImfB2P+i7K6B/Eis5a9rdvAmXguDGlpqEhhUii+HJGTQbN9I5WuYydWVQRC2SWuGCp/dkYqTgAEqelBeWNwz3gL1KydCZHj7W2YT7TJ6bOQJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=ZrC7Z+Xw; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="ZrC7Z+Xw"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ee786b3277so5380608a91.1
        for <virtio-comment@lists.linux.dev>; Thu, 26 Dec 2024 03:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1735211403; x=1735816203; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YSEiMoTS3y9YirLSL7wFibnluGhiJTczByFiGZPpavU=;
        b=ZrC7Z+XwCzID+dw75PKhhyFcFSeqnWamMHipF+TUMelRgYq8MpyXIbOgf3OKS7i397
         cQVm2EVQ1hNDkdVSzCU9guHllwwTKKV7WPtn98e59Hy0XJKuhDG45ifinRuRPiL4k5mj
         mC3mB4W/5myOQouSusd3tzJ9q5vSgJxBRh/4+ZlgajrcLsu1e0kdVYY0R3qXy1cEts13
         wY1N7VU03sXUDX5bQqczyxB5zdZlWhslKHH0B0suinnkJA/rt7hqgaW/YufXCkxAqTPZ
         COy6bTYL9txuE/EGmqD8rvGWkJVO2Ksv4ZHOW2iDePSa3vJbxjAmw8F/PjWACSBGt6AH
         iR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735211403; x=1735816203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YSEiMoTS3y9YirLSL7wFibnluGhiJTczByFiGZPpavU=;
        b=IVV75+bg6bixdzXb4+gLz8axQy4q7HoofPZqqdJexCGup2iyzLFiNy5/VeLQgx7YIn
         noahgeyoex+TK0lhJMIIe7pMLvcmzDlgso3wsPLfJlSc2h9qTROQZKtXjMT9RtXAuD3M
         s9tu5SNYSME1G6maSnvUGLubduefv0om+92HJDx5y/clQVYkTAuAv4+yRxWVaKkpkbfi
         gWIAzQWDWCUTwcSXSCBQCz/7ToKITUqfYesfL9ZzMveZsqYxNqHhd64C8nCQkbsLr4sm
         wlOKQppr3YC8+4Mqpc5B5EWxRlb7LHd1I3M6gVBKBxsVuTbl7KqtXF69EGYRlz3+Eet6
         IdyQ==
X-Gm-Message-State: AOJu0YwsjdfXG6Ja+cUPiZy6ypHIpYdtG4yqdscQ5xtC7ojecBB09HZ4
	FxBL99dZNIDD/ptgUp3SD2qpn8V0/EL2XWMW2KAdFNPMLmrUxGQb+juzrdBt4w0=
X-Gm-Gg: ASbGnctJ7gv7/STPDRARP27yRPXzDMvs35lqwmxgecY8aTx2PXTNsdtDcg84DPQvU/P
	Ca+HCGjd7qo12q3MPx2Db1gbbwYpOP5z5wzYXkOI5PcmKKwo9Q9v2dre8OM94BIrk/Oo6bKcE0U
	nL+4KPY/X0lajbXMfd44qnL8RhqeJ8wsmnQKuOmEgN42nSgK7VaxWiK88Q9f7wjRf3RVrlewMkd
	jl0m7kDP1hM3atmImDJes3Sq6Nsqvop4uw0b7+2eZ7zihHvqfCmlZ8Ogssd+pOwtBbHlw==
X-Google-Smtp-Source: AGHT+IGPnqIHAPHrV3oGfcDyGar9qxjbC/XS3mxs8LzNR0FdoFJQEv+D7XDGxUbRxY81ikYizjXwjA==
X-Received: by 2002:a17:90b:5252:b0:2f2:3efd:96da with SMTP id 98e67ed59e1d1-2f452ec37d0mr35015456a91.24.1735211402983;
        Thu, 26 Dec 2024 03:10:02 -0800 (PST)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962d0asm117939755ad.53.2024.12.26.03.10.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 03:10:02 -0800 (PST)
Message-ID: <452e2ba7-ef5a-4d89-8e25-93cbdf767011@daynix.com>
Date: Thu, 26 Dec 2024 20:09:59 +0900
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio-net: Ignore num_buffers when unused
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
 Parav Pandit <parav@nvidia.com>, devel@daynix.com
References: <20241226-reserved-v1-1-39ca566889c0@daynix.com>
 <20241226022749-mutt-send-email-mst@kernel.org>
 <20241226023128-mutt-send-email-mst@kernel.org>
 <5fe377c4-c10d-4c4d-8e8f-30420989452d@daynix.com>
 <20241226041018-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241226041018-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024/12/26 18:13, Michael S. Tsirkin wrote:
> On Thu, Dec 26, 2024 at 04:35:55PM +0900, Akihiko Odaki wrote:
>> On 2024/12/26 16:32, Michael S. Tsirkin wrote:
>>> On Thu, Dec 26, 2024 at 02:29:09AM -0500, Michael S. Tsirkin wrote:
>>>> On Thu, Dec 26, 2024 at 02:37:17PM +0900, Akihiko Odaki wrote:
>>>>> If VIRTIO_NET_F_MRG_RXBUF has not been negotuated, vhost_net and QEMU
>>>>> sets num_buffers to zero while the specification tells to set it to one.
>>>>>
>>>>> Let drivers ignore the field to make them compatible with both
>>>>> vhost_net/QEMU and devices already compliant with the specification.
>>>>> Also, remove statements requiring devices to set the field to one to
>>>>> make vhost_net and QEMU compliant.
>>>>>
>>>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>>> ---
>>>>>    device-types/net/description.tex | 26 +++++++++++---------------
>>>>>    1 file changed, 11 insertions(+), 15 deletions(-)
>>>>>
>>>>> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
>>>>> index 76585b0..b82fe8f 100644
>>>>> --- a/device-types/net/description.tex
>>>>> +++ b/device-types/net/description.tex
>>>>> @@ -683,15 +683,12 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
>>>>>    \devicenormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
>>>>> -The device MUST set \field{num_buffers} to the number of descriptors used to
>>>>> -hold the incoming packet.
>>>>> +If VIRTIO_NET_F_MRG_RXBUF was negotiated, the device MUST set
>>>>> +\field{num_buffers} to the number of descriptors used to hold the incoming
>>>>> +packet.
>>>>>    The device MUST use only a single descriptor if VIRTIO_NET_F_MRG_RXBUF
>>>>>    was not negotiated.
>>>>> -\begin{note}
>>>>> -{This means that \field{num_buffers} will always be 1
>>>>> -if VIRTIO_NET_F_MRG_RXBUF is not negotiated.}
>>>>> -\end{note}
>>>>>    \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets}
>>>>>    \label{sec:Device Types / Network Device / Device Operation / Processing of Packets}%old label for latexdiff
>>>>> @@ -704,9 +701,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>>>>>    Processing incoming packets involves:
>>>>>    \begin{enumerate}
>>>>> -\item \field{num_buffers} indicates how many descriptors
>>>>> -  this packet is spread over (including this one): this will
>>>>> -  always be 1 if VIRTIO_NET_F_MRG_RXBUF was not negotiated.
>>>>> +\item If VIRTIO_NET_F_MRG_RXBUF was negogiated, \field{num_buffers} indicates
>>>>> +  how many descriptors this packet is spread over (including this one).
>>>>>      This allows receipt of large packets without having to allocate large
>>>>>      buffers: a packet that does not fit in a single buffer can flow
>>>>>      over to the next buffer, and so on. In this case, there will be
>>>>> @@ -717,9 +713,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>>>>>      The other buffers will not begin with a struct virtio_net_hdr.
>>>>>    \item If
>>>>> -  \field{num_buffers} is one, then the entire packet will be
>>>>> -  contained within this buffer, immediately following the struct
>>>>> -  virtio_net_hdr.
>>>>> +  VIRTIO_NET_F_MRG_RXBUF was not negotiated or \field{num_buffers} is one, then
>>>>> +  the entire packet will be contained within this buffer, immediately following
>>>>> +  the struct virtio_net_hdr.
>>>>>    \item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
>>>>>      VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
>>>>>      set: if so, device has validated the packet checksum.
>>>>> @@ -764,9 +760,6 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>>>>>    \devicenormative{\paragraph}{Processing of Incoming Packets}{Device Types / Network Device / Device Operation / Processing of Incoming Packets}
>>>>>    \label{devicenormative:Device Types / Network Device / Device Operation / Processing of Packets}%old label for latexdiff
>>>>> -If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the device MUST set
>>>>> -\field{num_buffers} to 1.
>>>>> -
>>>>>    If VIRTIO_NET_F_MRG_RXBUF has been negotiated, the device MUST set
>>>>>    \field{num_buffers} to indicate the number of buffers
>>>>>    the packet (including the header) is spread over.
>>>>> @@ -863,6 +856,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>>>>>    This is due to various bugs in implementations.
>>>>>    \end{note}
>>>>> +If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the driver MUST ignore
>>>>> +\field{num_buffers}.
>>>>> +
>>>>>    If neither VIRTIO_NET_HDR_F_NEEDS_CSUM nor
>>>>>    VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
>>>>>    rely on the packet checksum being correct.
>>>>
>>>>
>>>> There could be drivers relying on it.
>>>> We can add a SHOULD not and ask drivers not to look at it,
>>
>> The patch adds the following statement:
>>> If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the driver MUST
>>> ignore \field{num_buffers}.
>>
>> Do you suggest changing MUST to SHOULD or rephrase other words in this
>> statement?
> 
> Yes, I would change MUST to SHOULD. Basically documenting the existing
> practice.
> 
> But I do not yes see why we should drop the device requirements the way you suggest.
> We just need to fix devices, it does not seem hard.

Well, I think we have already discussed and decided not to change vhost_net:
https://lore.kernel.org/all/CACGkMEt0spn59oLyoCwcJDdLeYUEibePF7gppxdVX1YvmAr72Q@mail.gmail.com/

> 
>>>> and we should fix devices.
>>>
>>> Maybe allowing 0 too is a good idea? Need to think through
>>> implemenation concerns.
>>> In any case, pls fix devices.
>>
>> I opted allowing any values for devices based on the discussion in the
>> following thread:
>> https://lore.kernel.org/virtio-comment/CY8PR12MB7195E5A1D321CABBA97D3FD7DC0D2@CY8PR12MB7195.namprd12.prod.outlook.com/T/#m5789536fe7405a7be18e167ff522c27333656fe9
>>
>> Regards,
>> Akihiko Odaki
> 
> That one asks for concrete data.

It asks concrete data that motivates requiring setting the value to zero 
and I decided removing such a requirement instead.

Regards,
Akihiko Odaki
