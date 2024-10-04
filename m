Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7C11CACE1
	for <virtio-comment@lists.linux.dev>; Fri,  4 Oct 2024 16:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728060814; cv=none; b=KojxLuojlj0JfYuiK3Ra99PevSwgukjxUb+DZONwKgAIEuJwokNhK00CFbW5HI76msD6fRNi9uLq507cynhXqvei2hI3QWqahP/Z7KvgXNXKQhkwaBNnCJuizUVmClt0Y0iRp/CM7QDSQLrQMcmjT7JecaDRtBML0WtAWYc9WA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728060814; c=relaxed/simple;
	bh=MnEE36ID496VolahyQI6xgiyZna+8JVRex8GwUa6650=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bQlfg2cvPtYuSzfe+hoifWI6TVV/OI1pmoKZoj0FXUifND8nR3nOGDp/Yv/tiDxBzQm2H+zDNtrGczWZVlt1g+lRdnXgYC0TVGRI/OCbY9Jx1Il7nqKz8M4qqoZe6uAouifOBO9UQqcSNwbv+4yuOEASTwCiXMu9ucjdLNQ8mbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eoXX5gd7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eoXX5gd7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728060810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UX1/GC8ZBbAZNAm3Dv03Q9wRdHbQOE5J4OpfO+LBVBA=;
	b=eoXX5gd71hmKxHf6f4BdsuJGSdIz+30Yrrlq+IROWg6Z7q/2qwUiYlFtZ8cu5TjmbBxmZD
	O0492kLPTWq8HvbJiVo5K39Ki7CiARO/wSa41ES2M1qtj9op5EGwnWAfWsbToNFQrZI+SE
	/xvDIev58F4u8urgVEDejMOSZaTISTk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595--aE1KqPhMfavGIWRfkUjMA-1; Fri, 04 Oct 2024 12:53:29 -0400
X-MC-Unique: -aE1KqPhMfavGIWRfkUjMA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42cb940cd67so22488555e9.0
        for <virtio-comment@lists.linux.dev>; Fri, 04 Oct 2024 09:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728060808; x=1728665608;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UX1/GC8ZBbAZNAm3Dv03Q9wRdHbQOE5J4OpfO+LBVBA=;
        b=VUB1CtCwpWOh9VJhXLDXCZ2lBMPK4MPU7kC7fPe5IF4CZiZXotrXOcQDyqFZP+4l3v
         Js3PUZZjNv0j0EMh9UlMPsX5Jm8ZGJHE4tq9V48XTobH3szMv5bwHPPZ/PEEMY9BcGXR
         ekInwQux8GjwezE0L63x2/8PlOhXKDAfjLN4NF9ODmzUSqeZqtK3UKfE+qkYEYi4JrGm
         okmPq1L0ZEbc0GUl3kfToSBEvj3AD5+f4YSOeEExFxLir0GA1jj7GOmLQYcEGva6Ga84
         mzq0h45nvvSSQ2+ITCa5FoY99Dtx0p9g4DB8CAnNFXGBDbcjTcOpPaCoHzOIInTBOPtn
         4+5A==
X-Gm-Message-State: AOJu0YxjIreDueQCCJCsFwL2Vnvqqgwpkb01XAnWEPUhKQ9FLqV9QiHq
	i5PhJfhf3Yv8A9+rFdnVECslcX5F1PWQuvI37GIwymKRpg+XAiIn0gRHDLtsmYpBVCTp2tYyuNF
	mINfnqRKfwsbp40Ldl7zQFzIISuG4XO/vCZqU/ra8eZQgJvjseIWCo7ktbP+aGi/N+3tZMfWxKV
	PkIoW0sL/4LRz3I1DTU/6YPALJ3WO3VyTNH5Cc/vPnEmct915Y
X-Received: by 2002:a05:600c:1da0:b0:42c:b802:47bc with SMTP id 5b1f17b1804b1-42f85af0457mr37100855e9.34.1728060807807;
        Fri, 04 Oct 2024 09:53:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHE9yf1DgZlejZLoL4fWa+NEetR2tFP1N9q1k3/Etag7aSpn6Sr0ZIHm2n4tAh+gsbaxeOYgw==
X-Received: by 2002:a05:600c:1da0:b0:42c:b802:47bc with SMTP id 5b1f17b1804b1-42f85af0457mr37100525e9.34.1728060807354;
        Fri, 04 Oct 2024 09:53:27 -0700 (PDT)
Received: from [192.168.88.248] (146-241-47-72.dyn.eolo.it. [146.241.47.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86a0a8a0sm19860515e9.6.2024.10.04.09.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 09:53:26 -0700 (PDT)
Message-ID: <54b59f12-74c7-4ec4-962d-b5a9d7490580@redhat.com>
Date: Fri, 4 Oct 2024 18:53:25 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/2] virtio-net: define UDP tunnel offload
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev, Jason Wang <jasowang@redhat.com>
Cc: maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
References: <cover.1728029499.git.pabeni@redhat.com>
In-Reply-To: <cover.1728029499.git.pabeni@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/4/24 10:13, Paolo Abeni wrote:
> Note that such while the mentioned PoC is based on the previous
> iteration of this change, it already deals with all the delta introduced
> here except the refined DATA_VALID handling. I'll try to update the PoC
> WRT that ASAP.

The updated PoC dealing with DATA_VALID according to the spec change is 
avail here:

https://github.com/pabeni/linux-devel/commits/virtio_tunnel_gso_v9/
https://github.com/pabeni/qemu/commits/virtio_tunnel_gso_v9/

It's slighly less untested than the previous iteration, as the 
CHECKSUM_COMPLETE/DATA_VALID code path is explicitly covered allowing 
the user-space to configure the tun device to set DATA_VALID on the 
xmitted virtio hdr.

@Jason, please LMK is something additional is needed to reach the board 
voting.

Thanks,

Paolo

