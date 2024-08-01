Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44511A3BD7
	for <virtio-comment@lists.linux.dev>; Thu,  1 Aug 2024 15:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722526489; cv=none; b=LwNvtB5tA/0zxj2IoIm/MfTE9lJyMdHaq6YFXIW3cPUI7+yM9sBnTZzxhciXaeyCugtHOKAuao556W1nmzgcSSiMLCkbuuWphV/NZDoAvNAVYYC54GoNP1qDp9/fpWmUty+1gqMf/50BsZWl2TNlRTFVoLXjOG9lgUto5kpsie0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722526489; c=relaxed/simple;
	bh=EFhM2ieA5CZHwqzVVF4FU6YtJbKEUYjw7KCwkjG14uw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j+NXdU669yFMDGEG+u+f3/WI++xSDGS/BxuGLhmH0k8S9KyHrQnCKuobHORF3rSPBttFPApuJ8aa/c4puqTkY51UMe5kHR0nCVCybU4Abn/ygzoqow/I53Z7hEG1eKyzWWmVV+qdHSmYU+n42+TH31kGu0A2DoEBVtiB3e2z8x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XEeCSEDI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XEeCSEDI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722526486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YU62UJHPeevG5RH1m+N22zRI35hYZLWcmd/9j3dcdk4=;
	b=XEeCSEDIfbKSA9ms6bxsKsexTXkDYv1U6M7LSJF4mMDwuxW+cck2CVmTOqyuoj/p3CTFdd
	5oBWETg6qUWguQyBjCtB92brzvuUPxPCyQk1lanZ0dxpwPXjJefaPpjMLoDgHCaTdNpLJG
	beLhD6jySuWa43kPMMWZVuTWM60vme0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-c7nb3zAQOyCwg6pRiqwBEA-1; Thu, 01 Aug 2024 11:34:43 -0400
X-MC-Unique: c7nb3zAQOyCwg6pRiqwBEA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4280ec27db9so6815905e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 01 Aug 2024 08:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722526482; x=1723131282;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YU62UJHPeevG5RH1m+N22zRI35hYZLWcmd/9j3dcdk4=;
        b=U7NkYc4WBZizbRMOwC89i43jPL6RzLeBxJMju/4rbf30Tz+xXELjkEKq0jnf8EKtWr
         /X1RalpdMRnkiXSo8UCnLnxjamVtPb/VeRo0Ujt1w59tkOY4f6Q2kHiZKPgjaqR+gtI1
         vDvH02Y/SS0ke9Up/KG/+Mpda1u52Op7/8GoKKXm1+sD9Nk6rsxM+RjYJ19zJpm5H0q6
         vUEFw+rqVr1dYfstSI5xH/DaoS2bX8Da8vm1T+0335ILPuc7Tye2k76AS1vQuWeIIvqs
         nU4pa+bjxqGpm4TVDTU3ZJBVEHOAjykZAx5CjG1KJ13uyQZcIKpjYwTVVaR68qUm3+X8
         A90A==
X-Forwarded-Encrypted: i=1; AJvYcCU/HBY4ojEdNqrStDeSUzSmq7rM/2I7Mb95wUR6J9rw3UXGUlLr6A825OydQ9jyKGto8NnbIMo+yFPgsSfeJFI/Pmv7N3Tt54t/nRNBSlU=
X-Gm-Message-State: AOJu0YwiyMvcrtjq4evCFxGStboZvB8iGCJOn3Bcfrrq55w0QVZaDb8J
	NeD+4wTKlOVgGilXXu8st/UZLUadqJ9Wo6T4k8PtlKnjDl9M/MqUot42JeRPBh5H3OgYMNJbWG6
	sKCPw++cpLG6xtjOGSbmCvaO3whqKgKCFwiyTprSP8fjHcHwkthIzcqirgrYB8Gl7
X-Received: by 2002:a05:600c:1c0a:b0:425:6962:4253 with SMTP id 5b1f17b1804b1-428e6b96d8bmr1068215e9.4.1722526482137;
        Thu, 01 Aug 2024 08:34:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9/lb+l2BaYw1h8KCxwR9Z1auL5gH1ejd1+hpYQvF70j8/anmkJKq8h2JIsCf6/H9lwGfhlA==
X-Received: by 2002:a05:600c:1c0a:b0:425:6962:4253 with SMTP id 5b1f17b1804b1-428e6b96d8bmr1067975e9.4.1722526481612;
        Thu, 01 Aug 2024 08:34:41 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1712:4410::f71? ([2a0d:3344:1712:4410::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282b8ada30sm58916275e9.19.2024.08.01.08.34.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 08:34:41 -0700 (PDT)
Message-ID: <494ee50c-eae3-41fb-9823-595ce00b0c35@redhat.com>
Date: Thu, 1 Aug 2024 17:34:40 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] virtio-net: define UDP tunnel segmentation offload
 feature
To: Willem de Bruijn <willemb@google.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev,
 maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <cover.1722252302.git.pabeni@redhat.com>
 <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
 <CA+FuTSfu8Sys_s+3jpXoS0GbZC4stOVgBrEYOtA9YoTCEJkJAA@mail.gmail.com>
 <d79c4ed9-c1d5-4c9c-9f10-661745edf96c@redhat.com>
 <CACGkMEu6dnKOgYVYRWKadXirnk4R6Rc16ojNR=oSX-a22Rt4OA@mail.gmail.com>
 <CA+FuTScr26P+QtPfWKzD1zzadKiZ3zRs75KC1ycexdQRAQ0XuQ@mail.gmail.com>
 <56d62e5a-b7df-43f7-8878-517505345529@redhat.com>
 <CA+FuTScunTfXGzpEFEgZcv3FKSzVwSK0vhuO61a=Ui2HybTsJw@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CA+FuTScunTfXGzpEFEgZcv3FKSzVwSK0vhuO61a=Ui2HybTsJw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/31/24 20:21, Willem de Bruijn wrote:
> On Wed, Jul 31, 2024 at 1:32 PM Paolo Abeni <pabeni@redhat.com> wrote:
>> What about reserving an additional bit in gso_type to specify the inner
>> network header protocol?
> 
> Similar to VIRTIO_NET_HDR_GSO_ECN?
> 
> Is that preferable over VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP4 and
> .._UDP_TUNNEL_IP6 variants?

Should be basically the same, as VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP4 
VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP6 will be 2 separate bits in gso_type, 
right?

> And to parsing just this one byte (or nibble) from packet data using
> inner_nh_offset?

I think one of the state goal is to avoid parsing. More importantly, 
accessing the inner network header content this early will cause 
possibly avoidable (or at least mitigable via prefetch) cache misses.

> If it's the best of those options, no objections from me. Definitely
> no need for a u16 if the only options are IPPROTO_IP and IPPROTO_IPV6.

Wrapping all the above I'll go for the additional bit for the inner 
network header type. If I misread something, please LMK:)

Thanks,

Paolo

