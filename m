Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5221CBE9A
	for <virtio-comment@lists.linux.dev>; Thu, 22 Aug 2024 14:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724336758; cv=none; b=DocxE5moRyNXE87X0wNbLNLhsDL3hEyGIHN5FMf2DO+hwgGOkLCXh12yMqrUx4myUXUi7qBamL6D8yFBqSLnc2jR6dmfHczKz4GPfI+1IFEBo8qW8+GMDuGiFxA2cXrA2lLsxd/Ls3tD7g8hJhT0hrH1BOBLjWXZ0DHQjCjL4VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724336758; c=relaxed/simple;
	bh=pakHRiieDffsAwCzV36qOEgN2l5ZSQMDQDVRsvk7oAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AuBR+sgt0l8MAqsmgPiV+XrJbdBn+jPsjcB6W3f4fKYfClnBeLLXoQYrcWPTZUBE7hxL3SCwdY8CPs7wA+vCO64d1BpZYO6nJXREDnt2HqP4/KRSDQCwUskQjVtO4rrQFbYe6EIHSamRP19lTFsTaMpxB9frTVWALPIQnHOyTe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AirqJ7/A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AirqJ7/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724336755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/VpPQddz7Fjlw6ZOuugK/moBk9ha+i77orrfV3tyVSc=;
	b=AirqJ7/ANdSA3WrZOfWkrTSbmfoavyURfHuIHgoUPjBXsGGQXXCO2mLRvrDehXaXczT67b
	HSGfpbldSBNeZpSiza73xeyI/iLd6owSQpIGfvjxtx9S/gou67MpYq6rI5dbyet6POOHuz
	xSw2bIy1WwKnzesyy8aQDGEKvSe8R84=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-d-DsWyF1Mcq8CC05fgg4zw-1; Thu, 22 Aug 2024 10:25:54 -0400
X-MC-Unique: d-DsWyF1Mcq8CC05fgg4zw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3718ce3f6bdso605884f8f.2
        for <virtio-comment@lists.linux.dev>; Thu, 22 Aug 2024 07:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724336753; x=1724941553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/VpPQddz7Fjlw6ZOuugK/moBk9ha+i77orrfV3tyVSc=;
        b=ITBYh3AMo6XtdQtEkay9PJAE9WOFvHfR6imwYRCO5zuNYEEJn6fqY5SR991ZLjhgUm
         jMHHxv3BhoQ9wWMqE/CscwVUOVTPSY3CgHBl6Cztng0kZbswb+ciRmxlgNFDC4u4GjBX
         wSI96I2Dk1nGoJmS/hJ3StLMI3jEmrkQuU+FQNF1nrsKCD3XL/Ects+At4ve8UQgqtlL
         AJqbX915SHOoR75vkz1CBPaUtjxc28ugnovIE9drUQxpzNDKI2h7g5dr43RPo3xNUPNi
         6zdEV0s2O92TcR6h02qh0fssn6hCHILMEngE6NnnUtDDhkSzdEDG5T47iXeatmkPkeGQ
         71WQ==
X-Gm-Message-State: AOJu0YyPkH57a++cOiNrbS1LMQa6bJcVsBfmT2uQcQecKI02aEOWCcgl
	f+0duvFzF/eQgotkUVd5IkH9XCokWdalEMJdG4r2tnQ+K/HxOfa0vsrnrIp4cjDJb6dPS9qOI12
	G9GKhkdCcBGY7dj0VeZEf73WtLj4tIgclMIeu7/kdXiRaMUdP4QdcIoVIYv0KcP6v
X-Received: by 2002:adf:f2c8:0:b0:368:4e35:76f9 with SMTP id ffacd0b85a97d-37308c337f3mr1950215f8f.37.1724336753652;
        Thu, 22 Aug 2024 07:25:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESnDyhf9nupML7Jj8vTl8Zr138W3S00jHOUSH89AijidD81iw/E7R0KdnEmYx+lcMgmO68PQ==
X-Received: by 2002:adf:f2c8:0:b0:368:4e35:76f9 with SMTP id ffacd0b85a97d-37308c337f3mr1950184f8f.37.1724336753044;
        Thu, 22 Aug 2024 07:25:53 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1b51:3b10::f71? ([2a0d:3344:1b51:3b10::f71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-373081ffb66sm1812092f8f.84.2024.08.22.07.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 07:25:52 -0700 (PDT)
Message-ID: <fec4d009-df32-40f4-9741-88a267e430e2@redhat.com>
Date: Thu, 22 Aug 2024 16:25:51 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] virtio-net: define UDP tunnel segmentation offload
 feature
To: Willem de Bruijn <willemb@google.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <cover.1724234131.git.pabeni@redhat.com>
 <04089a87ff34aa518345ba5b50aecf737fb03f40.1724234131.git.pabeni@redhat.com>
 <CA+FuTScjheR1htWujZ5=adBRB3+_z5KrCyHKoRGVapGq-MGtJQ@mail.gmail.com>
 <CA+FuTSd5PW6D0iSDSYjh3S6OpGCL1Lf95q_=eOfi=APXoBZyOg@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CA+FuTSd5PW6D0iSDSYjh3S6OpGCL1Lf95q_=eOfi=APXoBZyOg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/21/24 21:48, Willem de Bruijn wrote:
>>> +Geneve UDP tunnel (again IPv4) with no tunnel options. Note that the
>>> +only relevant variable related to the tunnel type is the tunnel header length.
>>> +The packet will have a 14 byte outer ethernet header, 20 byte outer IP header
>>> +followed by the 8 byte UDP header (with a 0 checksum value), 8 byte Geneve header,
>>> +14 byte inner ethernet header, 20 byte inner IP header
>>> +and the TCP header (with the TCP checksum field 16 bytes
>>> +into that header). \field{csum_start} will be 14+20+8+8+14+20 = 84 (the TCP
>>> +checksum includes the header), \field{csum_offset} will be 16.
>>
>> The csum_offset field is not even needed in virtio_net_hdr if gso is
>> enabled, as then the gso type already defines the protocol.
> 
> We recently started testing this invariant in the Linux code. We have
> learned the hard way to not trust userspace processes to set up any
> fields correctly.
> 
> For the new fields, we should from the start think of such invariants
> that can detect bad input. For instance,
> 
>      outer_th_offset < inner_nh_offset
>      inner_nh_offset < csum_start
>      csum_start < pkt_len
> 
> Maybe even more stringent invariant checks are possible. The only
> ones that truly matter are the ones that can affect device side
> correctness (such as host kernel crashes).

FTR, I intend to implement something alike:

	outer_th_offset >= 14 + base outer network hdr size
	outer_th_offset + 8 <= inner_nh_offset
	inner_nh_offset + base inner network hdr size  <= csum_start
	csum_start <= pkt_len - base inner transport hdr size

where base inner/outer network hdr size is 20 or 40 depending on ipv4 vs 
ipv6 and base inner transport hdr size is 8 or 20 debending on udp vs tcp.

> Not sure that we have to call them out in the spec, but perhaps
> helpful too. Either way, good to think about possible attacks on
> the new interface even before coding, before the spec is complete.

AFIACS the current spec currently does not describe validation for the 
existing fields subject to such issues (e.g. csum_start/csum_offset). I 
think it could be added in a second moment, if needed.

Thanks,

Paolo

