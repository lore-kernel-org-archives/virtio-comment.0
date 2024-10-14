Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13BC14037F
	for <virtio-comment@lists.linux.dev>; Mon, 14 Oct 2024 07:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728890444; cv=none; b=F4ZldhG3Bk+/zLclyZ8i0NkuF09h3z0cEQjsZzOqwxdtMalzDoCfqo5yNn01h5JmqQU3+5gxLYO7gSnm1u7bKYYemct+DQzCrm/72Zeub85Dqw+xpz/fCtPvSDfeZcDeIejqSYnLe8Y6DAqsEMlWBMzB2GRRzBHzq0n1kkO4eN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728890444; c=relaxed/simple;
	bh=jJcqPp5L3Q7+bJ0RRuMfg+6+6FTYHBfcR8Iqqa1kOdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y++vR7A4UdL7MLaaam99mA5p3e+RjupfBfopepiHUBs66yFyHIHth3SUdbGbADyzzoIYEXfNBv8HLh5mNzuWv7q7iBtWzdOSajYreM4c2OlVNDE0/cvMXuMWfUxmvl8Z2HE/Ov+/fT2jQyldxlZG/EOwJIGL1EB0kuuI4ZGJ2Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JviZqudf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JviZqudf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728890441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TE8qb70Uf6fZkB1KfTZsjiNLpbcbOw+zYaj+Yy7u/Fk=;
	b=JviZqudfzVt8pNLzpsHGLjygjveeL3RWtFbn9FlGad8bYW1SYPX66UUTH2zCXWpzEdImxl
	8S6OtidghS7bYkJPWVVU4EeVftJR/+BiBOcUdSwPluC5cHz+o6311ZKioobtBjeoMHa7X9
	Y2A+DueTZJwH8bhVkQRTZ8lJ7+zLiVg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-41uvjlscMtCZISuwHFHzkw-1; Mon, 14 Oct 2024 03:20:40 -0400
X-MC-Unique: 41uvjlscMtCZISuwHFHzkw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4311c47684aso17536235e9.0
        for <virtio-comment@lists.linux.dev>; Mon, 14 Oct 2024 00:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728890439; x=1729495239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TE8qb70Uf6fZkB1KfTZsjiNLpbcbOw+zYaj+Yy7u/Fk=;
        b=M8r7lTiUZUZf3HTOgzJ6FTxEbd993lyGyxh5ZBMvZ55TfbzpiLlzSfWHYb1ELfmD3z
         LZab2OPwU/lrOIwNyFvWjEpcGw9BUmPL2Mm7gSla9gfOAqoGfev35p1o7Q9AZ+FKUe0O
         fQFmCh432fkVF42No6u7IfCz1hE6xlh/2VDT7juKC7bHOzVRModpHJ6T6iIwsQo63Q/4
         zyt53mHny2Dzeqza52JLwvx6n9JU69dxdFbqhlYXO8uivA7U8Spdhcx+Lj2iNWKmWVmp
         eFclRjUaE/chTyIOr6tOHdq7bJAyc9Tom0KOs0s8bxRchyOGIXiuSjMtArg3r8F1xmrr
         Ew0A==
X-Gm-Message-State: AOJu0YzLxsfHqy9oDr34L3h9RTyh1o8DcXwLsqdpeh2O74txWeSjXAdF
	HXDY3hrLXQ0c7C5+SaCj8eLBTUC/yajbUQlxUxZK+bWXp0PyOCrNMLQll7cQWTksiyBrvv2LeGl
	ae+KuK2Q8sxq0VmC+h8F/dIaaw20VnTkDJ/ao54/OOyysQgRn2Kv8JMLwP5x7qH1E
X-Received: by 2002:a05:600c:81b:b0:42c:ad30:678 with SMTP id 5b1f17b1804b1-4312560907fmr68826055e9.28.1728890439596;
        Mon, 14 Oct 2024 00:20:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpKMBukQzbCclK4OaQlG+1WffqylX8V9jUIzO0JTpTSOV2Svn5QIHjXqGoMVNWO40SzMUCOw==
X-Received: by 2002:a05:600c:81b:b0:42c:ad30:678 with SMTP id 5b1f17b1804b1-4312560907fmr68825855e9.28.1728890439178;
        Mon, 14 Oct 2024 00:20:39 -0700 (PDT)
Received: from [192.168.88.248] (146-241-22-245.dyn.eolo.it. [146.241.22.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182ffd8asm111224475e9.16.2024.10.14.00.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 00:20:38 -0700 (PDT)
Message-ID: <10bc51b2-efbe-4f33-a1b3-827de4d0cd10@redhat.com>
Date: Mon, 14 Oct 2024 09:20:36 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload
 feature
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
References: <cover.1728029499.git.pabeni@redhat.com>
 <55306969c73f62bf4d100d15074bfd6cde741417.1728029499.git.pabeni@redhat.com>
 <CACGkMEvV0gtvgpb7z1MqJLKzHm-Be_8hkf0GzqqsFsfDG8oAeA@mail.gmail.com>
 <d34f50af-4042-44c6-90e1-0acbbb899e96@redhat.com>
 <CACGkMEvrowr6CwF+=RiR+f3EagdKB=rzyCPCQcUdXee4a5MaZA@mail.gmail.com>
 <2b90c368-b514-4077-a6bf-43da075af4fc@redhat.com>
 <CACGkMEu5GWZrYVRN==F=vrRQQGnxj_WqX86YZ+diqC3s3m2m_A@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEu5GWZrYVRN==F=vrRQQGnxj_WqX86YZ+diqC3s3m2m_A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/24 04:08, Jason Wang wrote:
> I wonder why not just introduce new fields for the inner, like what
> has beed done in the linux sk_buff implementation? I know I propose
> this before, but now I think it can help to reduce the complexity and
> more aligned with the for non GSO tunneling.
> 
> ...
>          union {
>                  __be16          inner_protocol;
>                  __u8            inner_ipproto;
>          };
> ...
>          __u16                   inner_transport_header;
>          __u16                   inner_network_header;
>          __u16                   inner_mac_header;
> 
>          __be16                  protocol;
>          __u16                   transport_header;
>          __u16                   network_header;
> ...

As the discussion touches many different points, please allow me 
wrap-up, in order of increasing conflictuality:

1) there are a few points clarification requests which are actually not 
needed, because the asked text is already there in the spec.

2) the DATA_VALID handling proposed in v9 is bad, let me scratch it for now.

3) you feel the handling of csum_start/csum_offset is confusing and 
would prefer adding new fields for the inner headers.

Let's try to set this most critical point first. Adding new fields for 
the inner headers has several dis-advantages:

- we will need to add more new fields WRT to the current proposal. Using 
csum_start/csum_offset for the outer we will need:

   inner_nh
   inner_th
   inner_offset

instead of just outer_th, inner_nh

- AFAICS, due to align reason, the above will require an additional 
<unused> field.

- the implementation will not be able to reuse the existing code, 
leading to duplication and/or hacks.

- will discard most of the discussions on this topics done in the past 
several revisions

I understand that one of the argument in favor of using new fields for 
the inner headers is to align with the current linux kernel handling of 
tunnel related fields. Please note that the existence of skb->inner_* 
fields is quite blamed, I suggest avoiding taking them as a reference.

AFAICS the main argument against the layout I proposed is the 
inconsistent usage of csum_start that will refer to the inner header for 
GSO over udp-tunnel packets and to the outer header in when the device 
does not expose the GSO over UDP tunnel support.

I argue that dubbing such behavior as inconsistent is a matter of 
interpretation: in both case the csum_start field refers to the 
innermost header that the device is able to parse.

Finally, the specification change to describe the new field usage I 
propose is quite minimal and almost don't touch the existing definition: 
it's difficult for alternative specification being simpler - especially 
when such alternative specification will need more new fields to be 
described.

Cheers,

Paolo

