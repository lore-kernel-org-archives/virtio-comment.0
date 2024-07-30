Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5F319149E
	for <virtio-comment@lists.linux.dev>; Tue, 30 Jul 2024 07:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722325987; cv=none; b=o5+5XzBHKzG795JiqsXXQtvohYAsU13VEq6b/03wTzpmZEkvdWYnjHlJEdp4U/5jbZB2+2CUwjZrRZHkCnNNYgifPnMJNsXKlEk/iU1kRU5Hhx8CbohG7ho3PLzAXH8Lb/iJIaEhJP8zFBa+oVgI7RHrQQbwwSzQWCvwosuRfHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722325987; c=relaxed/simple;
	bh=JSTTE+qe9jI/JMBf6ZJTiuYDnM5HyzKh5zCy0X5bj60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PBEoTH2D6tZRm8oFGlFbapPE993n/OuvV/G7NMH56Pslfsm5goZQdxvGkP7WsvNBQ/T9+9IeNPGGi2d1kGw1SIw+18n+nX/P8ZesBRjGH+OqqrSs3f75ZL5J2zQUpBC8aBFrdagtTim26iUiJs8LAszACPe5F/ELygwKCRFsWqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bU7s2G/i; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bU7s2G/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722325983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=63oPEh8vJu8qqn3vZZEapJR5CfETxp+JdHecBiOvAOM=;
	b=bU7s2G/iN7WL3WYV+bLSXkgJOsCHLicz9YNkONg5R/WSBG4F0zufsendkue01sV+t+frgn
	6bQJUEQBnq5RdDNWy/3gQ/uGCsicCz4J7PJLhL0UPzCrjSGSUV99hExdlrOXZLOQ1qTGyY
	ti+8LHXdp3INaYD08Eai/uAoXBq8jfw=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-TfHW9guPMWy1doe3eZzcBA-1; Tue, 30 Jul 2024 03:52:59 -0400
X-MC-Unique: TfHW9guPMWy1doe3eZzcBA-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2ef185db2b4so3730051fa.1
        for <virtio-comment@lists.linux.dev>; Tue, 30 Jul 2024 00:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722325978; x=1722930778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=63oPEh8vJu8qqn3vZZEapJR5CfETxp+JdHecBiOvAOM=;
        b=SQsEgkde8t7Zbs6DpuApiFgZ9IxJu6I0BMYv9k3ZhjGUODsIFBCSjhCBhLNP+denYK
         OI5G/zCNAHzKMheTlUnxPqU8z70MhM48bJ4bNZvBK5XjjX68QNthFFRdiqzbeQIFvQSD
         lPCB0y3vxjSFxosnUebHVO9ubRDI9nL8JTXGu6gnermBBOZJ18Zcuae//VLIkxwbRmzq
         +9c9DL5Qg5H88ws4DVhUgIPsJTfh9FyiMzo1MuFlMf0WCoXowjIjVJH301loCE9WIDMV
         Cj9uXHHXm2j3tdgHVUXlFcGaj2ka1qBXSj7yxzTGVYQMl+cc655/TCtjMeR57IFWPyte
         zEhA==
X-Gm-Message-State: AOJu0YyTrU/o0YsS7JF68RZrKmiGEMKfpupZ4jfa4rY9MFHMWNlSxIGt
	X4V0aoIVrGaqRZqQIwgzjfIji8/+moJoP8rPBCmCmjEaBeCfTOGC/DGVrVIbaIy6dFwIc3k9xFO
	/5fYWyOxg79mf4g17vSoI5YxzQLL9HC9HzaLrPaCeQ6CDVhBsUO9kERbLO5WjC3eV
X-Received: by 2002:a2e:1f09:0:b0:2ef:226e:bc6d with SMTP id 38308e7fff4ca-2f03c6fe6b4mr54320031fa.2.1722325978024;
        Tue, 30 Jul 2024 00:52:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+hB/XrACypbp0l9xucFEhS8UWaMh9SreH361hNeYi/axR3A6277WqQwbVZHabShOtWJbq/w==
X-Received: by 2002:a2e:1f09:0:b0:2ef:226e:bc6d with SMTP id 38308e7fff4ca-2f03c6fe6b4mr54319961fa.2.1722325977371;
        Tue, 30 Jul 2024 00:52:57 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1712:4410:9110:ce28:b1de:d919? ([2a0d:3344:1712:4410:9110:ce28:b1de:d919])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f935946dsm250828735e9.4.2024.07.30.00.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 00:52:56 -0700 (PDT)
Message-ID: <bfd5754d-5c21-4f2c-ab66-c26bfee5f854@redhat.com>
Date: Tue, 30 Jul 2024 09:52:55 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] virtio-net: define UDP tunnel checksum offload
 feature
To: Willem de Bruijn <willemb@google.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <cover.1722252302.git.pabeni@redhat.com>
 <5b3829e774a0bd43b7cb7119446486df42094d43.1722252302.git.pabeni@redhat.com>
 <CA+FuTScZMo3pOitzw3zqY8g7L_AE4LyaZnZEA3=a-vXOL5mP2Q@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CA+FuTScZMo3pOitzw3zqY8g7L_AE4LyaZnZEA3=a-vXOL5mP2Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/29/24 23:35, Willem de Bruijn wrote:
> On Mon, Jul 29, 2024 at 7:30 AM Paolo Abeni <pabeni@redhat.com> wrote:
>> +\begin{note}
>> +The dependency between UDP_TUNNEL_CSUM and UDP_TUNNEL_GSO is intentionally
>> +in the opposite direction with respect to the plain GSO features and the plain
>> +checksum offload because UDP tunnel checksum offload gives very little gain
>> +for non GSO packets is quite complex to implement in H/W.
>> +\end{note}
> 
> Plan was to call this UDP_TUNNEL_GSO_CSUM, to make this implicit
> dependency more explicit? It really only is checksum offload for the
> outer checksum that this feature covers.

Indeed. I lost that change in the split. I'll fix in the next revision.

>>   \item The converse features are also available: a driver can save
>>     the virtual device some work by negotiating these features.\note{For example, a network packet transported between two guests on
>>   the same system might not need checksumming at all, nor segmentation,
>> @@ -399,8 +419,9 @@ \subsection{Device Initialization}\label{sec:Device Types / Network Device / Dev
>>     checksummed packets can be received, and if it can do that then
>>     the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
>>     VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_GUEST_USO4,
>> -  VIRTIO_NET_F_GUEST_USO6 and VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO
>> -  are the input equivalents of the features described above.
>> +  VIRTIO_NET_F_GUEST_USO6 VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO and
>> +  VIRTIO_NET_F_GUEST_UDP_TUNNEL_CSUM are the input equivalents of
>> +  the features described above.
> 
> Minor, not specific to this feature and more to the spec maintainers:
> 
> Does it make sense to put each constant on its own line? To avoid
> having to edit existing lines when expanding. This is source text, so
> that does not show in the generated output anyway:
> 
> and if it can do that then the
> VIRTIO_NET_F_GUEST_TSO4,
> VIRTIO_NET_F_GUEST_TSO6,
>   VIRTIO_NET_F_GUEST_UFO,
> VIRTIO_NET_F_GUEST_ECN,
> VIRTIO_NET_F_GUEST_USO4,
>   VIRTIO_NET_F_GUEST_USO6,
> + VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO,
> are the input equivalents of the features described above.
> 
> The trailing comma is admittedly a bit ugly. If fixing that up, the
> diff is still cleaner with one constant per line:
> 
> - VIRTIO_NET_F_GUEST_USO6
> + VIRTIO_NET_F_GUEST_USO6,
> + VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO
> 
>> @@ -490,7 +512,7 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>>       new (16 bit ones' complement) checksum is placed by the device.
>>
>>     \item The TCP checksum field in the packet is set to the sum
>> -    of the TCP pseudo header, so that replacing it by the ones'
>> +    of the TCP pseudo header, so that replacing it with the ones'
> 
> Unintentional change?

Yep, I piped the patch in a grammar checker and while reflecting the 
suggestions on the patch itself I unintentionally touched the context, too.

>> +  \begin{itemize}
>> +  \item \field{flags} has the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM set,
>> +
>> +  \item The outer UDP checksum field in the packet is set to the sum
>> +    of the UDP pseudo header, so that replacing it by the ones'
>> +    complement checksum of the outer UDP header and payload will give the
>> +    correct result.
>> +  \end{itemize}
> 
> "set to the sum of the UDP pseudo header [of each segment]"?
> 
> as it will not be the UDP length of the gso packet.

AFAICS the Linux tunnel implementation uses the GSO length:

<each UDP tunnel> -> udp_tunnel_xmit_skb -> udp_set_csum

https://elixir.bootlin.com/linux/v6.10.2/source/net/ipv4/udp_tunnel_core.c#L170
https://elixir.bootlin.com/linux/v6.10.2/source/net/ipv4/udp.c#L890

Regardless of the Linux implementation, using the individual segment len 
will
makes things difficult for the last segment (len < gso_size). The caller 
will
have to touch the individual segment headers, which could be quite 
hard/costily.

Am I missing something?

Thanks,

Paolo

