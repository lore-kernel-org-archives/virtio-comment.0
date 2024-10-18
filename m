Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B10A20E323
	for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 12:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729254661; cv=none; b=qZujin9GO3Hh8zMZeJactf4LZgcHD3+wP6iTY8h38+amfKsaiSdjqNvG9BvSy8dwQOB9s2AiIQnZ+Qt5OrxRGbxwNu5QU7Bo4PS9wZ0x/K8g0wVYiBzKQNe4p6RzOkW01OYYQZP6AhQLpIkslFnHEFSi+Z01D4HLlrb9qkuIJt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729254661; c=relaxed/simple;
	bh=ooEcYlBiT0E98fHmm2zYAd3LmvZ+7nlKllHs/XjAbSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qwZe9BwPw4pgmI/6YfFc90cG9ALMKcjMghEWvzEuM3P25ZtTX4iaKo9bDVYHQ/tY3WX35LYldo96Afj8XBGqryv39d7WvAZSyMyUocMcQrYMe/48ZiWlPj5x9K5kfyFJzbuyBFDRIZ++tgjmxiZ1wOysuh567JX1fLdyi9osa54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dKa6Bnan; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dKa6Bnan"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729254659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QeGGlR7hZVAsm1CGynGdOP22Pvn+1yFSfUULGvppyQM=;
	b=dKa6Bnanat6K9Hs4ZWAI0uQKMEJO83JGwuRQRrfmVwkISascDDFSy+lIwn3IiM0dsD+g2+
	YP43pZ9+q3BRGRqqqIoPvBXKXeujMC9M3g8ghnQjaAO6EplOF7DME9Z1yX+TCmVSOou/Y2
	txxsQvJIkQvK0b35L2PxM1E9x4qp1T0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-_vjHb5NCM3OBwVGNGR9RWw-1; Fri, 18 Oct 2024 08:30:57 -0400
X-MC-Unique: _vjHb5NCM3OBwVGNGR9RWw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a93d0b27d37so141694766b.0
        for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 05:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729254657; x=1729859457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeGGlR7hZVAsm1CGynGdOP22Pvn+1yFSfUULGvppyQM=;
        b=imSokyrFSyGAP0LcbEpdAu68eyV6fCs8aBgNNtH/AHLVvAspzg+He37F5MIMzfxVTJ
         moK2IF3/5XcjsFzwEY8mSWPRZtkGm5IBUWkhE9hdIn+2MvElz6g9+AlWxACgAQwA9rry
         WSt8+sFwBxBRwB45CQerh6i4duQMa1ALSIUxf42Ax2CUv5NeQ4B/+nSwmdpVQ5tvD2r0
         I51hKOwxuU8KBwoV01fIZqEn/ZbOt6hv+O4fIRcSeVYSRDv+ya9Clzw6Fo3ccQA0clJm
         roe+ykvPxLdkfG4hUsM5SjYgDHQgXheO1UanCnzphz/88PCFE9OActKYjdWB2aVpk/V2
         ldCA==
X-Gm-Message-State: AOJu0YwL1q+1ssEbJ0z6BJ8KcA4lcEfX94YU6+1aLsWG2nGAYCyIfGuE
	tw8n/A0gTeAnkWEiLM8xq1fw/kqaEhIbkRbGWhNsW4hSOSQpToWR9eUJHf2fzXhxrsEiNeQulk5
	VF7WXaeX4K2ZYrha/5e0MyTsdeD+cs97M93KR5hFaD8RqIcjzPkfb0Vp2FG00ELTa
X-Received: by 2002:a17:907:97cb:b0:a99:f0f4:463d with SMTP id a640c23a62f3a-a9a69a793a9mr201257166b.26.1729254656636;
        Fri, 18 Oct 2024 05:30:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0zVO/YuoQvSo3raARcssNUjNNFQ36Shs9dO6lZfxf+aKBuCflPyqxC/ZFl6/ilr5oZJItwQ==
X-Received: by 2002:a17:907:97cb:b0:a99:f0f4:463d with SMTP id a640c23a62f3a-a9a69a793a9mr201252566b.26.1729254655881;
        Fri, 18 Oct 2024 05:30:55 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-231.retail.telecomitalia.it. [79.46.200.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68a921b2sm92361066b.15.2024.10.18.05.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 05:30:55 -0700 (PDT)
Date: Fri, 18 Oct 2024 14:30:50 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, 
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"mvaralar@redhat.com" <mvaralar@redhat.com>, Shahaf Shuler <shahafs@nvidia.com>
Subject: Re: [PATCH] virtio-net: editorial: Annotate structure field
Message-ID: <6fydagxrxocjfucgmbzgzge235y74kzmfshadzu5d3hsk4mqzz@6owfvcfidwwc>
References: <20241018032432.398821-1-parav@nvidia.com>
 <yruwppfhsjvpk47oheqhux244k4z3jyacqdx5bvywehn2qfwyv@uu5di5rkspkt>
 <CY8PR12MB7195C5BA3711596077E51860DC402@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CY8PR12MB7195C5BA3711596077E51860DC402@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Fri, Oct 18, 2024 at 10:16:09AM +0000, Parav Pandit wrote:
>Hi Stefano,
>
>> From: Stefano Garzarella <sgarzare@redhat.com>
>> Sent: Friday, October 18, 2024 12:43 PM
>>
>> On Fri, Oct 18, 2024 at 06:24:32AM +0300, Parav Pandit wrote:
>> >Field command-specific-data is a structure field. Annotate it as a
>> >field so that generated pdf shows it accordingly.
>> >
>> >Signed-off-by: Parav Pandit <parav@nvidia.com>
>> >---
>> > device-types/net/description.tex | 2 +-
>> > 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> LGTM:
>>
>> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>>
>>
>> Just for curiosity, but do you know why for example in the sub-paragraph
>> "Packet Receive Filtering"", just a few lines below, we don't use \field{} at all
>> when we talk about "command-specific-data"?
>>
>Good point. I noticed those few places too now.  Sending v1 with the 
>fixes.
>
>> Looking in that document there are parts where we use \field{} and parts
>> where we don't, is there a rule to follow? (To my knowledge for future
>> reference)
>Any structure field and structure name itself should be annotated as 
>\field{} when referring in the description.
>

I see, thanks for sharing!

Stefano

