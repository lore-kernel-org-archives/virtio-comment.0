Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71081D5CE0
	for <virtio-comment@lists.linux.dev>; Mon, 28 Oct 2024 12:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730117318; cv=none; b=Ikw2+399nVfGSdE3TJJsfAcpB/iXRu44Ehkc+S+CHS9GTHse+StRAkwPKkP0x0mTBzGye2H7+FuA+nhhkFYl59hDosWE5OjB2fwkdQFa7zy+RBYjYK/2Nnf+KOQ6kAL1/ovlEmGUaCo4nuSnoTMHuFTJ3bxlu0MI9YoSQzgBY30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730117318; c=relaxed/simple;
	bh=lve0AYolkoPYazvL63zPfuuoiC8Qg0I43gGma5f9gqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMMvGlOl+B6HNwcfaoP5+JO81gmmgL7gFmi0g1D/9RS3RKcLvIRRWYcMABydivZSgai/MwLLTLysWNsJD2+uvbVOg5VmQYKuEhfheWdLst95wXb9f47qh/ywrtWhldtHE1WwevH+BN2sJ0kZqVgWCvsCILtXzXzQs/Oo5IoHiV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i+me6QVX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i+me6QVX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730117314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rHj1XXNs9n2vifp0XpHEMUuX01L6P7U6x17eEEWGKWE=;
	b=i+me6QVXfSFmJi6yxIf6iCTi/kdIov1vXP+UdH0wWoKPktr4xqN0n7xsFFTycBrl5EsPxA
	IOuoXrDZ8Vau7O7Wr8sxncWnyQzxu3ce6JOlLiNujmprUDgkfWsUHK37WKq4LHFHYcru4O
	yLMPbITppsF4QmO3HSogA7EX33nPoiM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110--5ELaPXxM3qQ1bhdJRwu7g-1; Mon, 28 Oct 2024 08:08:33 -0400
X-MC-Unique: -5ELaPXxM3qQ1bhdJRwu7g-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43163a40ee0so32751015e9.0
        for <virtio-comment@lists.linux.dev>; Mon, 28 Oct 2024 05:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730117312; x=1730722112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rHj1XXNs9n2vifp0XpHEMUuX01L6P7U6x17eEEWGKWE=;
        b=HFegUW6Gc2czYmKZpo6ZbWXIfNQA8CKodcVKT14pTitj6x/mtxUHNVDbqvu5LmM0Bh
         K2LG67FG5QTHbVzq9ia5vEDYRcZFad7TktghkZXjAFBkNNzvV+hG1e5XJz3I99ItjOIc
         7Q9WRybqrWt3oN5hLFjkjRdxpIf8ORZhIVkzdwmgdI2cNzMzv/N3gPtUEEXp8S5L0x6B
         XoBCiwRIGlLXJogm8CCCopw+/MEk0x6X2kncofEhV+Y3wVeyK3pps5eziha/hfuFCExT
         32frzb4iuorOLWoD16OEGjUER3he6cT9Ywn3b6G0TkOcQr9IEc80QEYRO2QCq+Y9W0EK
         rpCQ==
X-Gm-Message-State: AOJu0YxnH+SoFlrFt8rzY/BKm2ZgCCcxECpriFFF3o7ycxiHoBan9o+q
	oqHHCn2gGK7X5So3zMhuWxc8LVNMFVlRC+gPu7nfPyiub7bGSX8/w4eeF+de1V3YKeYM6j0K5pB
	/GdNs9tlnaJ/HXGlLTj5UwiPhz0dMX3YKNEOzgZ/uxR25D9dl6/JT8b8UPZefMK2V
X-Received: by 2002:a05:600c:4694:b0:42c:b7f9:4bbd with SMTP id 5b1f17b1804b1-4319ad0aefbmr79364875e9.26.1730117312476;
        Mon, 28 Oct 2024 05:08:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/rMrkqDFPYuSOHNntAsMLPA43yyf09vg9gZHSWK0XGOzmH0C76+AbsaY6QJxwzHUDCXTmGw==
X-Received: by 2002:a05:600c:4694:b0:42c:b7f9:4bbd with SMTP id 5b1f17b1804b1-4319ad0aefbmr79364715e9.26.1730117312145;
        Mon, 28 Oct 2024 05:08:32 -0700 (PDT)
Received: from [192.168.88.248] (146-241-44-112.dyn.eolo.it. [146.241.44.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55f689sm137930285e9.16.2024.10.28.05.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 05:08:31 -0700 (PDT)
Message-ID: <a036a534-722d-49cd-bdb2-cf60aadd249f@redhat.com>
Date: Mon, 28 Oct 2024 13:08:30 +0100
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload
 feature
To: Jason Wang <jasowang@redhat.com>, Willem de Bruijn <willemb@google.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, kshankar@marvell.com
References: <cover.1728029499.git.pabeni@redhat.com>
 <CACGkMEvrowr6CwF+=RiR+f3EagdKB=rzyCPCQcUdXee4a5MaZA@mail.gmail.com>
 <2b90c368-b514-4077-a6bf-43da075af4fc@redhat.com>
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
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEs4xb=xEH2RwQYZFEP9WGdwT2jOSERmpzTto+PQuxgcwg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/24 04:27, Jason Wang wrote:
> As the topic becomes more complicated, I wonder if we can do something
> easier, that is focusing on the one checksum offload first. And I
> would like to check the current Linux behaviour first for non-GSO UDP
> tunnel:
> 
> 1) For TX, as you've mentioned, the csum_start/offset has already
> pointed to the inner header (but is this the innermost?)
> 2) For RX, what header would csum_start/offset points (considering we
> have nested tunnels)
> 
> I'm asking to make sure our proposal doesn't conflict with the
> existing implementation.

In Linux, csum_start/offset, both for rx and tx, points to the innermost
_offloaded_ header.

On RX, since GSO partial does not apply, such innermost offloaded header
correspond the outermost/only header (when no tunnels are configured) or
the 2nd outermost, when tunnels are configured and GRO-ed.

On TX, via GSO partial and local csum offload, the csum_start can, in
theory point to an header with an header with an arbitrary high level,
but currently no driver/tx path allow for GSO partial with more than 1
encapsulation level (may change in the future).

The proposed specification change in v9 for NEED_CSUM matches the above.

Since reaching an agreement WRT DATA_VALID handling looks problematic,
would you consider a virtual meeting to discuss the topic?

Thanks,

Paolo

p.s. to be clear, with 'you' I include both Jason and Willem.

