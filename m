Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7729229408
	for <virtio-comment@lists.linux.dev>; Mon, 21 Oct 2024 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729528046; cv=none; b=gqQx4p6fMnjPdbeyCIOl8TMzgvXHqrfjE+1I7Y6252X/uj/srq7pckT0CdE75Xg3FRteZ/Bmwd1K0Jn7Tc+8y/Ha2K8fPWi7czg6r+d1+wq75jYcxf3cFptyKtcmYK5QbX3lcgilYNocpQHOru93XTa92kzNrj6v0iLHlyKFj9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729528046; c=relaxed/simple;
	bh=Sf2rOQPdViQFuU/S1g13RzQrwHIFt3n13KznPmKQrxs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lhyqiAxZipomzY163w3CgukEOW+XLQxdSK4WWD4P7Z+TMuJLbhntmZ8VPJJrrFZrb5UoEFvMAZVFjmzev20VeBz9nj13MXUl5f0g8jq97WFawiuYeEm1vuPquwNQIQgZmGLNAaqU4rQOQr01beBdbDZMnOZqTyRP3RnazMwdumw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KYjjcBgo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KYjjcBgo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729528043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GwXPLekp3bkb/DLawB4g9WVmVSyvoH1fzN2ZzpvIy14=;
	b=KYjjcBgo3gvpyDGTtp1gnsqqHXrTt6Yhz4nA3JCKvsbHPie5AeX8GVta60WozFTihwYy6Z
	yI8pu5BY8RqGH3/uVJCYgO137GmRSnK/lOH+u5iXDBEaeIuaXCcirYSB7QRdjSNb+C4UZI
	5NHx1Wv9rUkyzzYBsEdiagGgXaw77IA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-xwj7zSVLPpG9VfSDMLeEsQ-1; Mon, 21 Oct 2024 12:27:21 -0400
X-MC-Unique: xwj7zSVLPpG9VfSDMLeEsQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-37d5ca192b8so2503404f8f.1
        for <virtio-comment@lists.linux.dev>; Mon, 21 Oct 2024 09:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729528040; x=1730132840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwXPLekp3bkb/DLawB4g9WVmVSyvoH1fzN2ZzpvIy14=;
        b=frpgm0ai1mEItflJgRJvl0hLWr4c8pMgu6KpdbYXb6GHS+RlxmswI6Jp6OxBYvtCBK
         gD8XrBDWUOTWsg7isjYkbv58JTIo2zJI/jtJ9TWpucZsNnngXy4+HFBR4yCme6mW94+6
         hY8YZb+p0mSG1/zBLtonH+BU5EGjN+tKIfZ+Eay0xba9DneoqMtxP1JIZ4bJpqQrG82H
         RjbW5JiSdvPYZCCIZ7NKpicKFPffv4EezhbDotlJQSlaeEKYZ/om50nWeGbJ04U+rkry
         vwgxbESGkwo1RRx7BxnylJYkfkhGo2c0JjM6+4WLNLRsbKPLPVFZ35bHb1yfDZdd651Q
         aQmw==
X-Gm-Message-State: AOJu0Ywk8cjixgXBQ0jIPXPhRcWA4Td4EJMpRGmTTVQ/94V6jYpSvJco
	U5dVSLzshR4CmtHTIptx1iY3CKLjgdD2GZXyBKvb4DGD9pwKX+CL2xQZXym6biM1veD+96szLR4
	kBXK9fTSPp53YXHxsEZdcTXTqHuZIRsD5Sf5cRNEda4hDf5+pflMxh2H7HZxoCrmj
X-Received: by 2002:adf:ec01:0:b0:37d:43a8:dee0 with SMTP id ffacd0b85a97d-37ef12a7763mr157911f8f.17.1729528040524;
        Mon, 21 Oct 2024 09:27:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ/vtwBRbEhGG/hNW5Du/5WM6Y4ainj0/HoW5f+gda5xOOVbEzNCb5WFMLR461bJNt9WIuKw==
X-Received: by 2002:adf:ec01:0:b0:37d:43a8:dee0 with SMTP id ffacd0b85a97d-37ef12a7763mr157894f8f.17.1729528040164;
        Mon, 21 Oct 2024 09:27:20 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1b73:a910::f71? ([2a0d:3344:1b73:a910::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5c3173sm62092975e9.33.2024.10.21.09.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 09:27:19 -0700 (PDT)
Message-ID: <7f40f3da-aa6e-437c-af73-97e44e1982d1@redhat.com>
Date: Mon, 21 Oct 2024 18:27:18 +0200
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
 <10bc51b2-efbe-4f33-a1b3-827de4d0cd10@redhat.com>
 <CACGkMEuhJXMd0hGopyehESO1eNVRXVX+FaF7m8f6Y9yWCzoESA@mail.gmail.com>
 <44be2d9c-5624-4419-8e9c-e5302a5f6b2f@redhat.com>
 <CACGkMEsgJT1c93RZur20fUyjtxSX6dMPePEJvzbmNWpAHd92Mg@mail.gmail.com>
 <3e3d6984-65d3-46b0-aaa3-e6591123f95a@redhat.com>
 <CACGkMEsiRJ2zAcys0iFQkiL0h9MY-LOE4=LP7s4ksN=T+HY_Xw@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEsiRJ2zAcys0iFQkiL0h9MY-LOE4=LP7s4ksN=T+HY_Xw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/21/24 08:54, Jason Wang wrote:
> On Fri, Oct 18, 2024 at 6:10 PM Paolo Abeni <pabeni@redhat.com> wrote:
>> On 10/18/24 06:26, Jason Wang wrote:
>>> On Thu, Oct 17, 2024 at 11:34 PM Paolo Abeni <pabeni@redhat.com> wrote:
>>>> i.e. all the checks in
>>>>
>>>> https://elixir.bootlin.com/linux/v6.12-rc2/source/include/linux/virtio_net.h#L97
>>>> ..L112
>>>>
>>>> will be meaningless in such scenario and the GSO over UDP tunnel helper
>>>> code must replicate them with the correct offsets.
>>>
>>> I don't understand here. It works like a charm for non GSO UDP tunnel,
>>> anything that makes it can't work for GSO?
>>
>> I we chose to use csum_start for the outer header, for GSO over UDP
>> tunnel packets:
>>
>> 1) the 'all headers in linear part' check:
>>
>> https://elixir.bootlin.com/linux/v6.12-rc3/source/include/linux/virtio_net.h#L111
>>
>> and all the need preeceeding algebra will be useless,
> 
> This part I don't understand. We still need a validation for the outer
> header and we've already done this for non GSO tunnels already.

For GSO over UDP tunnel packet, what we need to ensure is that all the
headers, comprising the inner ones, are available.

Checking that the outer header are there does not avoid the need for
checking that the inner headers are present.

Checking the inners only is instead sufficient: if the inner headers are
available any preceeding data will also be available, including the
outer headers.

>> 3) the csum_start/csum_offset assignment performed by:
>>
>> https://elixir.bootlin.com/linux/v6.12-rc3/source/include/linux/virtio_net.h#L104
>>
>> will yeld the wrong values - as they should point to the inner header
>> for GSO over UDP tunnel packets.
> 
> See above, it just works as a non GSO UDP tunnel.

Note that all this topic is about GSO over UDP tunnel packets, and which
layout is more consistent for them.

For GSO over UDP tunnel packets, if we set virtio_net_header csum_start
to the outer, we can't reuse a single line of the existing code, as the
tests will be unnecessary or will give the wrong results.

i.e.

-
https://elixir.bootlin.com/linux/v6.12-rc3/source/include/linux/virtio_net.h#L171

would flag as invalid good  packets, as it would over-estimante the
packet payload size

-
https://elixir.bootlin.com/linux/v6.12-rc3/source/include/linux/virtio_net.h#L179

would drop every TCP over UDP tunnel packet, as csum_offset will be 6
even when the inner header is TCP.

Instead if for GSO over UDP tunnel we set csum_start to the inner
header, all the existing test will yield valid result - mostly because
the Linux kernel, for such packets, expect csum_start pointing the inner
header.

And that is IMHO a clear sign that for such packet csum_offset should
point to the inner header even for virtio_net_hdr.

Cheers,

Paolo

