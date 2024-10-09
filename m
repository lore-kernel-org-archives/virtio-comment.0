Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CF51885B3
	for <virtio-comment@lists.linux.dev>; Wed,  9 Oct 2024 08:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728461353; cv=none; b=lsTqf5iFa8lMGRgI9/EFxCImO/Z8zvmQZutS3FqDRwROcMZF3Zl6m/ob28Z77/jdNRbGM8WVWq24vEgNemzajYTGsqRXE60383dYiZ3/DrLuSPwFbSTzzyHUWr4iQnS2Yeho667YumnJAe0Mh00G62TegvCwdGOJlm3tAiId7eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728461353; c=relaxed/simple;
	bh=eKulgsB5ISxornenNDvRk090OVhllxL3R3KVrEskQW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PX3Y8BgupK4Wv6x9sr4Xr9wk5qWmDrQytg4/AIKNllI0xW0cpjnBY8Ju2Cx4+x2xkhEj5m96/yCEVyhq0osFySG9SS3fJinfpmqLHcbCsz4n5IxuGi09paUGzXVecAEdanP8h1Cm87cwS3Stz5dw33hyoV5zxG8COE3VOyvp8Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I2LUGFUT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I2LUGFUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728461350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1pIiO4iJ4OEBFBTDNVqPOsxkvFGXpWSzWs6bNUlpERQ=;
	b=I2LUGFUTTf7DxZt5gQm3U6AELeBMLsZB0qxPcB38x2oQKoUO91vc+XAyv+8odVanrWqIUa
	aHCs1eXjKcwxan7iusb4YLfx9Op0xKHQDVqyEwhxsxiGVfeDbuYSI4znLcWpHZ3AUNH+AW
	qqB7farFOtnSDJBrByMN9MvyEceSzGE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-P7HO77KNOWO4c60mjX4yAA-1; Wed, 09 Oct 2024 04:08:39 -0400
X-MC-Unique: P7HO77KNOWO4c60mjX4yAA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a994dbc405fso242036366b.2
        for <virtio-comment@lists.linux.dev>; Wed, 09 Oct 2024 01:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728461317; x=1729066117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1pIiO4iJ4OEBFBTDNVqPOsxkvFGXpWSzWs6bNUlpERQ=;
        b=sYVGDd0SIG80ZyCl6qkYSKu5FMdzln9UUlq6bZ/erU7kPI+eidAvX0Cl6UHFHelI1R
         4UtAeLOJtRC6jsSkHdgCVgrKDqOt2thBKCzeBPPc9iyh0M0kXEU5PcGHIju0dZx0JRHV
         sDIUGo4IVrLp7Qtuc7mwWLgWqDbsnA9oQUyT/5t9laq2ewEDdjM/iAqdovTX3DTYSg8Q
         cUiMqut8X6af1XVp9I5RIPknOu/yVxYkTl6rADrztmMNdT9WNelqNZ5zZnolyuPeHZ7P
         wvL4hNpObJy4VwOE62v5dab1vrT+S5zZESPUZ/ODQAM0vIjN2QuoVHDG2yyB64mIlLwh
         w8FA==
X-Gm-Message-State: AOJu0Yx898kAaK7VCEWiLtc8K2gqRUIMkWzY7Wd4eatO+7VTIIZkUGgQ
	0jI8anRWlDrHMJ0jP5k9nhmj7qjHoz01+vVFpCaHLS4aO27vd/52c5QqslGueBw7An/08Vnm9Nb
	MgrVcQ9H990pSw1Ui4mqDaUbnbUy1ysXwApc3utj1JsQaXx+qAz1LtxCqN4E8KCX5+JRB55Kfzp
	k=
X-Received: by 2002:a17:906:d259:b0:a99:42e7:21f with SMTP id a640c23a62f3a-a998d224f32mr133461466b.37.1728461317586;
        Wed, 09 Oct 2024 01:08:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZzu4EOaf3J3w92GFgQ2M6tCjN0D6xAYaZ1mf9me7ydwkdN9xf5NsnDS7Lx9BLTSKUIzA31g==
X-Received: by 2002:a17:906:d259:b0:a99:42e7:21f with SMTP id a640c23a62f3a-a998d224f32mr133458266b.37.1728461317128;
        Wed, 09 Oct 2024 01:08:37 -0700 (PDT)
Received: from [192.168.88.248] (146-241-42-55.dyn.eolo.it. [146.241.42.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a993657f469sm593026266b.223.2024.10.09.01.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 01:08:36 -0700 (PDT)
Message-ID: <d7accb9e-4978-400e-8675-8188d02dfda4@redhat.com>
Date: Wed, 9 Oct 2024 10:08:35 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] virtio-net: define UDP tunnel offload
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
References: <cover.1728029499.git.pabeni@redhat.com>
 <54b59f12-74c7-4ec4-962d-b5a9d7490580@redhat.com>
 <CACGkMEsV9jrsAHLZn2gJWeb7+R0W360n7fjg6E3QiA4CZgaUvg@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEsV9jrsAHLZn2gJWeb7+R0W360n7fjg6E3QiA4CZgaUvg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/9/24 09:24, Jason Wang wrote:
> On Sat, Oct 5, 2024 at 12:53 AM Paolo Abeni <pabeni@redhat.com> wrote:
>>
>> On 10/4/24 10:13, Paolo Abeni wrote:
>>> Note that such while the mentioned PoC is based on the previous
>>> iteration of this change, it already deals with all the delta introduced
>>> here except the refined DATA_VALID handling. I'll try to update the PoC
>>> WRT that ASAP.
>>
>> The updated PoC dealing with DATA_VALID according to the spec change is
>> avail here:
>>
>> https://github.com/pabeni/linux-devel/commits/virtio_tunnel_gso_v9/
>> https://github.com/pabeni/qemu/commits/virtio_tunnel_gso_v9/
>>
>> It's slighly less untested than the previous iteration, as the
>> CHECKSUM_COMPLETE/DATA_VALID code path is explicitly covered allowing
>> the user-space to configure the tun device to set DATA_VALID on the
>> xmitted virtio hdr.
>>
>> @Jason, please LMK is something additional is needed to reach the board
>> voting.
> 
> It should work at a first glance. But the tnl_offset and new ioctl
> seems a little odd. Any reason we can't deduce it from the features?

The tun device does not know the complete layout of the virtio_net_hdr. 
It knows only the total size but is not aware i.e. if the 
VIRTIO_NET_F_MRG_RXBUF or the VIRTIO_NET_F_HASH_REPORT are negotiated.

To support UDP tunnel GSO offload, The tun device must be able to parse 
correctly the UDP tunnel fields, so it must know at least the tun fields 
offset inside the virtio_net_hdr structure.

The new ioctl is added to pass such additional data. A possible 
alternative would be piggybacking the mentioned 'tunnel offset' inside 
the offload 'long'. I avoid such option because it felt quite hackish, 
but it you feel that as preferrable it's still doable.

Another option would let the user-space know to tun all the relevant 
negotiated features, but that look quite more invasive (I would avoid 
such option at least for a PoC).

> I'm asking since the design needs to work with hardware implementation
> as well. So any channel outside virtio (e.g the TUNSETTNLOFFLOAD) may
> not work.

I've no idea about the above. My uneducated guess is that H/W 
implementation will still need a S/W interface, and such interface could 
implement the new ioctl(). In any case I guess a new SW and/or firmware 
revision will be needed to support UDP tunnel GSO offload on virtio H/W 
impl.

/P

