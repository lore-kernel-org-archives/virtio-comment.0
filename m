Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C7B1DED71
	for <virtio-comment@lists.linux.dev>; Mon, 28 Oct 2024 14:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730125401; cv=none; b=HddtfCPTHzI8kCVrjZfEgA58/6rttmeM6azLknJT7erBUrab793E6JroLSSJn8bVp+vLJtnvig+0rATBUK8w0tuDoX+nki9BO1yJilEZM2tNK7gFWZRUYFEIQq6DwAVbx6zzfpDgKviElcE+VVB5Ee/JM22r27cKSM0HxyWQi6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730125401; c=relaxed/simple;
	bh=m61/ddcfDDhmjbYXazXsfaGlewCVYukIcn9gay8BNp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8Db5Vla2pIC2HV9ch6nevu3LpdtsjrVOcjtJF2rKpvecjgcuKSuag6lzqe9do9xR61oWc+OqSWG96/KP9ScWd1jXIVPE7kyTKuDcMHfHqf2CclQgTXrYtdxCAZ1pJ2GdVC4YxM47TpatXYmIypu9x3PCammW911Hohrv2LSuzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jP7uh6y4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jP7uh6y4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730125397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/WWuVkSyWnu2uQPfnmDY+U+8CxLy3FDWTV3VAM4qjAs=;
	b=jP7uh6y4gPnuMHBLgC1wZHofhcn/Wahjc0497pcp4+jtc33f5gv12OsEYP5hDZ/dehjt44
	/glTZ0qSEZ+H7+3nl98ICCf+ozm+3AV0cMoUtfyN/JwHjHUj1FkPEK7IB+cr7ElP9G2fiA
	b/4CtSE6tpZHPEi9PZo1ZspTBUwH90U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-DxSO-7yfNmycYl29_3S5eQ-1; Mon, 28 Oct 2024 10:23:16 -0400
X-MC-Unique: DxSO-7yfNmycYl29_3S5eQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4317391101aso31945465e9.2
        for <virtio-comment@lists.linux.dev>; Mon, 28 Oct 2024 07:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730125395; x=1730730195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/WWuVkSyWnu2uQPfnmDY+U+8CxLy3FDWTV3VAM4qjAs=;
        b=Pc0m0uOXscBiRyo5khqSrb7Wjqjyl6ZHsv6hBXo0i6NDGByy/5cw3o7I0MjnG867Z2
         MQwyqZU1dqMg+G1A5TpWjuBbdHFGxeJiEfBVgCCzKndilSwW5lrGe0HkX/xjAWdRaO6u
         6WjlpkWyndShfVnlDrk1R34sXkZ7qyINois4g0LCZkqp+4JvhyKVLohIBfK/eGtq6Qhi
         XzII0JMDlSs8vcUPSTHxKfEbmf7kEDCg1x4y4r5hw7FdXuLrpzl6yX+1pVb5rAt6sSZQ
         v7wxaNWE7MpYzuE8Tm7SbCUBj+OaLJOMX593S5mwyAjD5vQmUVPO1yV62zMLiJ/laMl8
         sIMw==
X-Forwarded-Encrypted: i=1; AJvYcCXIsDwyJQTmT+t2q1XBGMX6wCh6DRJzzHfbbJpaFa07EUCOO1VwpXHX24QXt0zWN5qUX0thdSX/srqTOFHR7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNER+ynkc6Ooxw51TR/90hP49CBXgIdBuxdbu1Kz/Zy8KZDs1e
	39eegL/L4spmAFhmajLoRUVGT1lZIoK/LGm55r2UFUS/cf0aBDVu1Z04XSswno4LP9Wg3MWf/8/
	iNXU0KU0mNqaVLrCzFrQl+aEP3GO7dqfcVlgVP1q8AVUEwRbpozxw3HKB9TiN314b
X-Received: by 2002:adf:a789:0:b0:37d:4894:6878 with SMTP id ffacd0b85a97d-380610f7ed9mr6012878f8f.10.1730125395169;
        Mon, 28 Oct 2024 07:23:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4Sn+15jlVsZgx8MVE/EmawO9ZLLuDgrgnPQzOUpG/vNL7NKtVsxPy5AdvEXWCDn0WboWV7A==
X-Received: by 2002:adf:a789:0:b0:37d:4894:6878 with SMTP id ffacd0b85a97d-380610f7ed9mr6012859f8f.10.1730125394790;
        Mon, 28 Oct 2024 07:23:14 -0700 (PDT)
Received: from [192.168.88.248] (146-241-44-112.dyn.eolo.it. [146.241.44.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b47a41sm9613333f8f.52.2024.10.28.07.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 07:23:14 -0700 (PDT)
Message-ID: <2efd983f-b589-4039-b905-cba8d0a77ab2@redhat.com>
Date: Mon, 28 Oct 2024 15:23:13 +0100
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload
 feature
To: Willem de Bruijn <willemb@google.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev,
 maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, kshankar@marvell.com
References: <cover.1728029499.git.pabeni@redhat.com>
 <CACGkMEu5GWZrYVRN==F=vrRQQGnxj_WqX86YZ+diqC3s3m2m_A@mail.gmail.com>
 <10bc51b2-efbe-4f33-a1b3-827de4d0cd10@redhat.com>
 <CACGkMEuhJXMd0hGopyehESO1eNVRXVX+FaF7m8f6Y9yWCzoESA@mail.gmail.com>
 <44be2d9c-5624-4419-8e9c-e5302a5f6b2f@redhat.com>
 <CACGkMEsgJT1c93RZur20fUyjtxSX6dMPePEJvzbmNWpAHd92Mg@mail.gmail.com>
 <3e3d6984-65d3-46b0-aaa3-e6591123f95a@redhat.com>
 <CACGkMEsiRJ2zAcys0iFQkiL0h9MY-LOE4=LP7s4ksN=T+HY_Xw@mail.gmail.com>
 <7f40f3da-aa6e-437c-af73-97e44e1982d1@redhat.com>
 <CACGkMEu-83JEcs73R4Eym2tkcUT5Zsj7i2qOsB-9ivmLNf0b5g@mail.gmail.com>
 <5da197a8-a022-4c2d-a4ae-09e0948e620e@redhat.com>
 <CACGkMEu-AQea98e5xqj4Vfo4zog_nzeJQ_pLADAOY9ZogsS8AQ@mail.gmail.com>
 <a6ad7c40-d65d-4b95-a7ae-86d77eda4bdf@redhat.com>
 <CACGkMEs4xb=xEH2RwQYZFEP9WGdwT2jOSERmpzTto+PQuxgcwg@mail.gmail.com>
 <a036a534-722d-49cd-bdb2-cf60aadd249f@redhat.com>
 <CA+FuTSenzDeaWSorCEywzu84W62oykmyNWuKyFeiB-aeJMt6sA@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CA+FuTSenzDeaWSorCEywzu84W62oykmyNWuKyFeiB-aeJMt6sA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/28/24 13:26, Willem de Bruijn wrote:
> On Mon, Oct 28, 2024 at 8:08 AM Paolo Abeni <pabeni@redhat.com> wrote:
>> On 10/28/24 04:27, Jason Wang wrote:
>>> As the topic becomes more complicated, I wonder if we can do something
>>> easier, that is focusing on the one checksum offload first. And I
>>> would like to check the current Linux behaviour first for non-GSO UDP
>>> tunnel:
>>>
>>> 1) For TX, as you've mentioned, the csum_start/offset has already
>>> pointed to the inner header (but is this the innermost?)
>>> 2) For RX, what header would csum_start/offset points (considering we
>>> have nested tunnels)
>>>
>>> I'm asking to make sure our proposal doesn't conflict with the
>>> existing implementation.
>>
>> In Linux, csum_start/offset, both for rx and tx, points to the innermost
>> _offloaded_ header.
>>
>> On RX, since GSO partial does not apply, such innermost offloaded header
>> correspond the outermost/only header (when no tunnels are configured) or
>> the 2nd outermost, when tunnels are configured and GRO-ed.
>>
>> On TX, via GSO partial and local csum offload, the csum_start can, in
>> theory point to an header with an header with an arbitrary high level,
>> but currently no driver/tx path allow for GSO partial with more than 1
>> encapsulation level (may change in the future).
>>
>> The proposed specification change in v9 for NEED_CSUM matches the above.
>>
>> Since reaching an agreement WRT DATA_VALID handling looks problematic,
>> would you consider a virtual meeting to discuss the topic?
>>
>> Thanks,
>>
>> Paolo
>>
>> p.s. to be clear, with 'you' I include both Jason and Willem.
> 
> Works for me.

Thanks! I forgot to mention that it would be great if you could share
(even off-list) a few timeslots that could fit your schedule, and I'll
try to find a match.

Cheers,

Paolo

