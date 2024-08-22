Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AE82C87A
	for <virtio-comment@lists.linux.dev>; Thu, 22 Aug 2024 15:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724339946; cv=none; b=MVts5WmeLeV2tH5R4IUo3BxRoVkoXxoN9EnLLwhNil0f5kPFm5Bm3H/v9iszzeXSiboz0+rZj5rKha/W0pNwCD4hydDgasT+He4hrC9KlNskCyJL/myAmPK+e54hSWuxvWo4KnMnhbuewRr/t9HDqBq1VeopBzcKggaWi9HBE1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724339946; c=relaxed/simple;
	bh=LxJZR2qpsPSfpJ3Gof3keACzxIoJnMeBnUn64bSPvGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oKRHEUp7Q6a2UDEGpCRIq9xb25HPlBqA6xUdMlu4/Ij0a4tHuRMGuhaft/bgR9HguujAjSeQxTgZwupTztC1VVVRm1utnI2ujzz0Had0f82HmbSujD954WhmzbL3KAssyAnrEITI61UrjF1HfcpTuABv7m69SBh00LNkW6r0MY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QlAYIY83; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QlAYIY83"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724339943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2AvozHttCkqSRI+hpFo3eDuIDIavqB8F/AVkDWG9Gs=;
	b=QlAYIY833s08H4S+0BuwqZf+sIHLUDdasxjVeIVwa+XDiHV/kblaMgyjjocaV487knVc+n
	MLbsZgKlwLq+yWoEYOpJJtH7ssCpXQLq0RBvhNEJj0TQW2EITQx7zu/hldV6rJGVhVjH16
	TkDlwseNB5jMNNY/xM0JkS9qNhMxm44=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-ISFdeNemOxmEuxjNacHruA-1; Thu, 22 Aug 2024 11:19:00 -0400
X-MC-Unique: ISFdeNemOxmEuxjNacHruA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-428fc34f41bso8120085e9.3
        for <virtio-comment@lists.linux.dev>; Thu, 22 Aug 2024 08:18:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724339939; x=1724944739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P2AvozHttCkqSRI+hpFo3eDuIDIavqB8F/AVkDWG9Gs=;
        b=BsmGmn8hes77v8xgSq6kkRvX4ofFnE+a9D/tyi2srMG0OHW/eskx0TcTTd5KC4FOI1
         73V70pVN8oexkThdxyCbDkTYDVM29ZnWXziok6dzMZI9qsd1BIzElqtanct4fkzNUlOB
         bqAoFM1crN8h05ufnsMEg1sedZB0+bP+iruXS1j0r2CsOQxN0ynwxm6sU+dcQhiDlsrg
         Bop7Fo2YDRZ+K+IZclwVXVFi0gdt4w/PPtAvatLIIRgJ3w8FCNmJdOKso/bfQqEMCaEl
         okOuz0JWPk9m7jzxrbdhE+31H0Q/uNikhnSC1wIWPJnuuXiathYmPAM5I/jvYtx49iYw
         TlMA==
X-Gm-Message-State: AOJu0YyX+Ls3MfRGofEM5mh3O2anrs3X7ciVPQS7arKJ4eTliUfy3Ni/
	UmypB+I2urpMT308cRU3wViTkB/8FXNbbPPPBFEvuf1adeyBgOm9dM/rG39usMo2p5pXZ/lJTIm
	cbHnFSK5xiKngGFwbPemqQUPFpo3iYj5+PqxTnQbmxgkM8hJET9ao5sgl3RJS3gvs
X-Received: by 2002:a05:600c:1f85:b0:427:ff7a:79e with SMTP id 5b1f17b1804b1-42abd21323fmr40497935e9.16.1724339938850;
        Thu, 22 Aug 2024 08:18:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJcsVTKwnUCoEmnQfHR0MrO5GUvsVYXm9wlVh7h3UXjrXhzn7RRvkaOrwuDtM8ZKWEMnY4ow==
X-Received: by 2002:a05:600c:1f85:b0:427:ff7a:79e with SMTP id 5b1f17b1804b1-42abd21323fmr40497705e9.16.1724339938373;
        Thu, 22 Aug 2024 08:18:58 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1b51:3b10::f71? ([2a0d:3344:1b51:3b10::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac51584c0sm27667435e9.15.2024.08.22.08.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 08:18:57 -0700 (PDT)
Message-ID: <48eaa7e7-3cd7-41ca-8109-892702ee9350@redhat.com>
Date: Thu, 22 Aug 2024 17:18:56 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] virtio-net: define UDP tunnel checksum offload
 feature
To: Willem de Bruijn <willemb@google.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <cover.1724234131.git.pabeni@redhat.com>
 <b3a93378fbe02aefe4450f97e21138a757c41036.1724234131.git.pabeni@redhat.com>
 <CA+FuTSe1Wz8T5NDUA-h1izZ1mhz3z0jsK8XH6tgtREz00B9nhw@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CA+FuTSe1Wz8T5NDUA-h1izZ1mhz3z0jsK8XH6tgtREz00B9nhw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/21/24 21:42, Willem de Bruijn wrote:
> On Wed, Aug 21, 2024 at 6:03 AM Paolo Abeni <pabeni@redhat.com> wrote:
>> @@ -425,6 +446,7 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
>>   #define VIRTIO_NET_HDR_F_NEEDS_CSUM    1
>>   #define VIRTIO_NET_HDR_F_DATA_VALID    2
>>   #define VIRTIO_NET_HDR_F_RSC_INFO      4
>> +#define VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM 8
> 
> Only now notice: since this is only valid with GSO, should this be a
> gso_type bit, like VIRTIO_NET_HDR_GSO_ECN?

I originally placed the flag here for consistency with NEEDS_CSUM, 
before making the TUNNEL_CSUM offload depending on TUNNEL_GSO offload.

I think it's still a valid choice: the bit space in 'gso_type' is quite 
low; will be significantly lower then what will have in 'flags' with 
such change, I *think* it's more future proof this way. Do you have 
strong opinion otherwise?

>> +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM feature has been negotiated,
>> +and the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
>> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
>> +the driver MAY set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
>> +\field{flags}, if so:
>> +\begin{enumerate}
>> +\item the driver MUST validate the packet checksum at
>> +       offset 6 from \field{outer_th_offset} as well as all
>> +       preceding offsets;
> 
> I don't follow this comment: when programming checksum offload, why
> does the driver have to validate any checksums?

I must admit this is plain cargo cult programming, from the original 
csum fields specification. I naively (and forcefully) interpreted the 
original statement as 'the driver must validate the csums related 
offset' (yup, it requires quite a bit of good interpretation will ;).

I now think we are better off dropping this sentence (and similar ones) 
completely.

Thanks,

Paolo

> 
> Same in two other locations.
> 

