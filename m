Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A8E1B4157
	for <virtio-comment@lists.linux.dev>; Mon, 25 Nov 2024 16:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732550501; cv=none; b=oWSjY+K9vrOyormwqD2n63T/GqV5kL64lr2Jpx9n01crwx1zSp7LSKHpDbb45uRo9Wx78QQ7tI5ICWEmb0d/2TZ03JdnNbN62fTxQhzK2WsY3JZB8E6uIbhje+V9WAMPNTG4qcQe0YJ97Uc1Ozi3J/svE9vpKuM5XyUyfg7wOhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732550501; c=relaxed/simple;
	bh=kYhVuXCuAM6sHqUYdwiQH92xmLGl3MFkAa+2rELNGJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o+Yvd2qcCdT1uYaebXHpK+W40LPVvrJQ0bcRXRRpudIC06DNWPSAV5Sc1+1XaPyFCbhKg+LLMz4Q2Fi3FH1ryPX2NfOXmTmAY4CuLdTD8+S6cuLIWKniNJpVKOpJXr6FXBw7pBVBlSQniajE4q9ClO1clCKLpVb8B66nY3AJHtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J4AJ+59M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J4AJ+59M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732550499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FSSSl1CHABbs6ineHlXIzOT/4gNOd8kuP6vgplfIpEg=;
	b=J4AJ+59MjYFTG8dPZxk7o1HLFg3qNWSgFsEx90+l6lVDB4Sf9ao8FCE+uWOendggapEz1y
	lG2ZNTVsUR4K0MKDPMQbAauFqReXBq61FOrnn4gAXlPC7OGPBXUWirRJulhMStudKFDlGg
	SZt7xetZtk72BS4CGFwzeZJZ2qS3dh0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-MdQne6m_M4q25nJPXLWjAQ-1; Mon, 25 Nov 2024 11:01:36 -0500
X-MC-Unique: MdQne6m_M4q25nJPXLWjAQ-1
X-Mimecast-MFC-AGG-ID: MdQne6m_M4q25nJPXLWjAQ
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6732101a6so28913785a.2
        for <virtio-comment@lists.linux.dev>; Mon, 25 Nov 2024 08:01:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732550492; x=1733155292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSSSl1CHABbs6ineHlXIzOT/4gNOd8kuP6vgplfIpEg=;
        b=pFSt2y0cBWD7YhXwMnW4Ahj6X4NSOJKUdbGKDgV5g7HR+wAc1Ua6vDTDdiFCSbDUnW
         fA7n+oMh3pfzD3Q6rsVTWhd6cIWHx6Uiv/iFoN7VpffBJKD+DJqQnp1sIU/095/rA3QH
         H84GquSQwzbHtjcFEh7slNK2c1gC81ZainoloUo/tjuj5OQFiYgjnVhfNqvEVCpBI+Dj
         CKGx3GV2jNFKaDlBYfkrx9+ah/fumB4xe3DC35JbNOQml/VOxNH5hykCj6JNVkoRrKI4
         VetQjRf8D/8VQXN6DgnQel3cbEiPVR8dkUBuju6q6++CijovdYNUo/kj1Alw+CdJQ8zA
         H8hQ==
X-Gm-Message-State: AOJu0YyBCyxeu2ypKabcgCU9fpM1+2AzcIyEG7hNatD1rCQasFdkuiFV
	mkVflILJMNn1yUoAAUKIxQQvl1bmCMWpbJOzJ13n+SnS6ZvsoZPB8ERMu5f7W6rBkjRCE9yh7rS
	YEgRoeiUzryC0f134ypru/x0VsTby/pRt61HmESZirQAmpjDL6XP1JutGK8roVcx3
X-Gm-Gg: ASbGncuSkfFepUVcacdpnkmnPnzwn2HEB3ALviSsFUe45JOyWoQPPdWlzIdb9WNQr7g
	OeLCKhTMLE1h8h05o60Yl8WmehwG8aGTPKEUBfdY5RCv+R7yoSoUBPMtlRpzqrTcAmVNe5yY6zG
	Om3rfYz6nr1hGMulzrxgpEk/6WM2Y7qIpQZEdnh7oYwXwZWoU9o4/l3ne6c9NZcZUQXmhp35+8J
	OW2C8DZNgkXLsR09gDZg8X69dvdJQLzZo7SatvzyjXnaIiXeqOcaZ5PLVsVXjY3nbM9zqEnhskl
X-Received: by 2002:a05:620a:469f:b0:7b6:73de:f340 with SMTP id af79cd13be357-7b673def751mr27832285a.12.1732550491770;
        Mon, 25 Nov 2024 08:01:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6+KtkK7TbHACYIJJKntWIghv6KVPhJ2HBXB0hQ7qG+6XAsBEfRbZAQttBU8kircyHVEn//Q==
X-Received: by 2002:a05:620a:469f:b0:7b6:73de:f340 with SMTP id af79cd13be357-7b673def751mr27828985a.12.1732550491313;
        Mon, 25 Nov 2024 08:01:31 -0800 (PST)
Received: from [192.168.88.24] (146-241-94-87.dyn.eolo.it. [146.241.94.87])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b514048e46sm361199785a.72.2024.11.25.08.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 08:01:30 -0800 (PST)
Message-ID: <067ebefd-8d1b-437a-97c0-f5f771102a94@redhat.com>
Date: Mon, 25 Nov 2024 17:01:27 +0100
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/3] virtio-net: clarify NEEDS_CSUM semantic for GSO
 packats.
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
References: <cover.1731084277.git.pabeni@redhat.com>
 <c03a1ec585fd7755eaeea25b690e1704ad5260db.1731084277.git.pabeni@redhat.com>
 <CACGkMEsxRJVS5vyhJedj2RYuWG6B7ME6JbVEo1H9sgTgJR=ubg@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEsxRJVS5vyhJedj2RYuWG6B7ME6JbVEo1H9sgTgJR=ubg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hWltJFEDbHjx4i-jRv-L9C-XA7eY9O1D9C6K9gd0Q8Q_1732550492
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/25/24 03:51, Jason Wang wrote:
> On Sat, Nov 9, 2024 at 12:53 AM Paolo Abeni <pabeni@redhat.com> wrote:
>>
>> The current wording is a bit unclear hinting to possible additional
>> nested headers. For GSO packets virtio net (currently) supports
>> offload for the checksum of single transport header, explicitly state
>> that in both the driver and device sections.
>>
>> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
>> ---
>>  device-types/net/description.tex | 11 ++++++++++-
>>  1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
>> index b2a0d39..3099c6f 100644
>> --- a/device-types/net/description.tex
>> +++ b/device-types/net/description.tex
>> @@ -605,6 +605,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>>  \item the driver MUST validate the packet checksum at
>>         offset \field{csum_offset} from \field{csum_start} as well as all
>>         preceding offsets;
>> +\begin{note}
>> +If \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE, \field{csum_offset}
>> +points to the only transport header present in the packet, and there are no
>> +additional preceding checksums validated by VIRTIO_NET_HDR_F_NEEDS_CSUM.
>> +\end{note}
> 
> I wonder if this defeats the purpose of LCO where the outer checksum
> could be deduced.

I don't see how?!? The added statement is not a behavior change, it just
clarifies the existing text. I don't see any implications WRT LCO.

Could you please describe in details the eventual problem?

Thanks,

Paolo

