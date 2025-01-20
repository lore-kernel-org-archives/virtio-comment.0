Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAAC19004D
	for <virtio-comment@lists.linux.dev>; Mon, 20 Jan 2025 08:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737362679; cv=none; b=Np0sx6LQBVV/ZZKcGQAxcQFNWIKy0cQ+IhnQNl4IVpeLzkxglLDH/1A54fz+zyVJ0Ww25pcNCCcIo+qg5ccX5POosETyR8WjUwsc4k8J9sfJ2rDVX1hE4GtdeN9lzd7gxsOQVGVmvdqdTRspg9GpVYTa8l/rYKr8ocK5stYN84o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737362679; c=relaxed/simple;
	bh=XBCjqv8+QwtsOCTVSznLPZXhmgSC94HvK+WeRu479Ro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CXEA6hUAanUKRh+HaoJuoADIG1uAxNkjnDcG5KuHNCEBsFBHZvBlSLRSExwwu8MuQu5gHNdiF7r/SEZ2O/f6L/0+cwi9s+/JzK+3Q7v9qT4ptJS+7Bv2PwMI/VRtQqBpYBI5YxGiEfUPEYqgaW5yx0aqFxE16GrN7dQiFXxFghE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XTHEi/3a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XTHEi/3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737362676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tKxlnvLtm47jTSaV74mFVtAd59sjdc+WZK6X12SBLck=;
	b=XTHEi/3aKkSLrrZ2g3a+54D6IwcPI2fBN5c8xSPOp6SzTDFTAVnvwON3ay8qH6W45gtIO1
	EJt8jqFJKKwiPOykgwj5Qz1/ae9tX9vDhpvFDCLuPxCujqRMDNMA456UZ4FUAndl9/eLJs
	e+oXrF+jkAoYpOcBxNWGawRlp9zkHWk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-FElv0-YEOsSGYlsC6WO7ZA-1; Mon, 20 Jan 2025 03:44:34 -0500
X-MC-Unique: FElv0-YEOsSGYlsC6WO7ZA-1
X-Mimecast-MFC-AGG-ID: FElv0-YEOsSGYlsC6WO7ZA
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3862b364578so2369959f8f.1
        for <virtio-comment@lists.linux.dev>; Mon, 20 Jan 2025 00:44:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737362673; x=1737967473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tKxlnvLtm47jTSaV74mFVtAd59sjdc+WZK6X12SBLck=;
        b=J+Tt6r+WfZ4rxB5U8gfz/FWvaxCEBELWLt9vllTS1kEvyuFG/BFjwBf6hl3F2rTBkO
         P6KNBRgfJ+wt2RcocSDaHc/ICX5l4aVwnw6htlsrBdBF5dv0GCPw7ONeLhZSgJ/bQUTy
         k6UxN5REJBmE3ZN1Xca6YkhVzVPQZXwNsk5LmYAM6AtJWg3Rw/6j0L2PprhXto77omVr
         C7CdPVAmb2/zc2X3fF7wB676itpqzwArL6VAOgjLlrU+WJaf7hr5V8voVYI9L769a438
         XGbPVAUjG1eRzayEuN+1OdGX8jg359+SI7/kaAKwTVyb5e2IYXS5t9xHZROO7mknyD3F
         Ygkw==
X-Forwarded-Encrypted: i=1; AJvYcCXT6lgTrPEx7RwSQKa7SE8M0fU5RJlNzhgbXKotE3x+Fl8EyvRhEu/uARHWC7h96ggvwlq/wTXPgEUN9GLwRA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw32AXgrvFMwjiTEr7tcqyMtaEJRqROnuEnlQ7bA2vWh1a2PdfT
	spDCGSYwt8+8wLe6E5Ym9aA7bFcSaJqP6sAtn/AWDbxbK5zqnPRTet5rYtFuKO/WYEQxPlsDYRN
	L54MqDT/9+8BxczC8mBPTMlEs4MMRPYG59MGkQxlxqyugeUnYjCP+UnHMUHsPzgFf
X-Gm-Gg: ASbGncs9CiTWqmuQBLEusJNHR11SBPnj/UT3K8VpN2DS+Z/k8iDYL7sv7M+spwh6sX7
	kojwK/vuAPTR40VYkEWCVf+UJnSZp/ivpevW7AlBtwZxmvPuKtW3ui93kBVfq2eDDT1sZJJFavI
	ekxG4pO8OHp8dkIJSnnen5yk5TgwTw/5ANkUsDu1EALregis5dybqdyKES7MZ1mwgUco0Zjlwt0
	9NI9tfWYwnyNL7BswsQWagTfAhUOeULMNpUj9ZV5ufDYvPpmaoyRsosYBKyLKqAaaFAtGde9uLp
	LEp/ACRXVRDmU4GZWnAzjGjW
X-Received: by 2002:a05:600c:698c:b0:434:f9ad:7222 with SMTP id 5b1f17b1804b1-438918d3bdcmr104624405e9.7.1737362673181;
        Mon, 20 Jan 2025 00:44:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbW4cBj2+ESzV53hYMuqd4+yDkvpD1ZVu7Ph9y9BNZhg1MmrRdkAbtFJIIpqR6GhrbFNVh8g==
X-Received: by 2002:a05:600c:698c:b0:434:f9ad:7222 with SMTP id 5b1f17b1804b1-438918d3bdcmr104624275e9.7.1737362672796;
        Mon, 20 Jan 2025 00:44:32 -0800 (PST)
Received: from [192.168.88.253] (146-241-15-169.dyn.eolo.it. [146.241.15.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74c6ceasm190884485e9.24.2025.01.20.00.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jan 2025 00:44:32 -0800 (PST)
Message-ID: <81a73808-74b0-4663-8811-d8b9e7016b38@redhat.com>
Date: Mon, 20 Jan 2025 09:44:31 +0100
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/4] virtio-net: define UDP tunnel segmentation
 offload feature
To: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Cc: "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 Eelco Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>,
 "kshankar@marvell.com" <kshankar@marvell.com>
References: <cover.1732699986.git.pabeni@redhat.com>
 <3e1c45071c8cf4efc7ca0ecc7b52a73c6bf983fe.1732699986.git.pabeni@redhat.com>
 <CY8PR12MB7195D914B9EF00FF62C5E1DFDCE42@CY8PR12MB7195.namprd12.prod.outlook.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CY8PR12MB7195D914B9EF00FF62C5E1DFDCE42@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bQlxyEMdk9R3ROvgUuKpCKiDyEbz7wfJVPmuBDrTIl4_1737362673
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/19/25 9:06 AM, Parav Pandit wrote:
> Hi Paolo, Michael,
> 
>> From: Paolo Abeni <pabeni@redhat.com>
>> Sent: Wednesday, November 27, 2024 3:07 PM
>>
>>
>> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (46)] Driver can receive
>> GSO
>> +packets
>> +  carried by a UDP tunnel.
>> +
>> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (48)] Device can receive
>> GSO
>> +packets
>> +  carried by a UDP tunnel.
> 
> Feature bits 42 to 49 are not applicable to device specific type. They are reserved.
> Please see the note. 
> 
> Current spec description is:
> 
> 0 to 23, and 50 to 127 Feature bits for the specific device type
> 24 to 41 Feature bits reserved for extensions to the queue and feature negotiation mechanisms, see 6
> 42 to 49, and 128 and above Feature bits reserved for future extensions.

Thank you for the head-up! I missed the above point.

> So 2 bits of these patch and of patch 4, 46 to 49 to be shifted to bits 65 to 68.

I can cook and send a new version of the series with the above change,
but it will take a few days as I can't start working on it before
Thursday and I want/intend to update and test the PoC code accordingly.

/P

