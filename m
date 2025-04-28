Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785F42797BD
	for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 17:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745860040; cv=none; b=gmGVKCnGFeVNay9uf6wVlehV8QZx63BMhkOJD31qhuc+ZphcGwSeTIRufjwLgtPTEPYQr4Y0sFv/wcrThp3Wxc1bxBdlQAiyAgxZsYNe5X3p23ricphyYC13TIlLbvUuLFB4f6wCYpGw1iy2Osc7//T8LYJxwKJEBEJoli1qDW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745860040; c=relaxed/simple;
	bh=1GwS/gFz5nJq4ghFjbup8i522AYBv7awnjs8J2nszWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mR9gIZlRhjIhfaYg02B5W8eiPM4+xUejzR581g9pTUaCASWOB3bXT5k+pTHuc1frvqA8giWERkqd71hDiqL92FXbClP2UcDaIpxVWJLUat1fwfyh5UPC0+iZMooC3zF/5s60MTj3hucBefZkMUQfP6JJyoE1su0GUQGmKVtkf0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rz/jNh7W; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rz/jNh7W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745860037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1GwS/gFz5nJq4ghFjbup8i522AYBv7awnjs8J2nszWU=;
	b=Rz/jNh7W4vJowtP9OnoX7y+xGjWy31Pq+fdoT2smenqgxAYmpSm9h6arCCrHxwaIyyjYs6
	2fwOlUW0VrlSGKeLXzZLRzBy+ahG9ZocUs7aBZD63pcZ8lbpeIzwyewyFfLo2jjxQVvQz9
	GocNAQU9nfkYewXa4RLK3C7+2Cfoqyg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-usCtxI5ROeuzFN74lxvpNw-1; Mon, 28 Apr 2025 13:07:15 -0400
X-MC-Unique: usCtxI5ROeuzFN74lxvpNw-1
X-Mimecast-MFC-AGG-ID: usCtxI5ROeuzFN74lxvpNw_1745860034
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d733063cdso31861215e9.0
        for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 10:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745860034; x=1746464834;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1GwS/gFz5nJq4ghFjbup8i522AYBv7awnjs8J2nszWU=;
        b=ZFWpGe1Tzh3TaKbmf1WgaLrsUqn/xcBkvwDooLfqfckOcZ+qEW0A1Poo7Z7RcjEyDY
         sgJ1kynDFLYeKZOXI1CQ977FiX+GrUbxLf/o9eBcpENLHJofn90mrsiKqNvGpTQomgN9
         ULt0/JqA5Tbx3EixDmx0vIVw1ff6pFDRzdU3WiLIbfTqxzfVe7dXyy2ZfILmtVCozkNt
         UZ4EaaYVI/qn9kHFBvcVVIcyVfo56fnVG2HC73xlP29WQi2dJO1JHg2NyjqzD5+xqJ99
         RzIJ71dcuRhzg22gxD26pV7p0ntc338qEQzNYUXUUti3XUY0a3HJlzgDFN9O9Ud0VF99
         wKHw==
X-Forwarded-Encrypted: i=1; AJvYcCVpjNwGi46SgtNM/RGnc2azFz7fiUF2uegciCf6ZyF9+Ej2KKvE8jk8For+YYE9Ev4CyciNNItu56faBVA64g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQYstyo/ux6FVE4zg2a9sPg+5TAKBt/ROw3nA5ZhpAcVOe8bwY
	DGMDEDfjLqDwO9P8UGCiXKovhF8CBxPC3pYNPP6buL/qPR+dTHtRHs/RRhGG91aJwyRxSh+kxIC
	vTD1l22euMwtjeKSVS4CNGpajaUsdl2nDQrAD6JUpBXLdwW7x+Q1W4cah3F+bqeHI
X-Gm-Gg: ASbGnctS+4hnxaWKVqPO1NyNwPIWm53ZZg9RTtN6tNaaS8wzFI1EywjcdOaXsaJYtc+
	aAtIdh4RKqxk79RMehoFc+7zzFFTX/oKYVo2c2cElsvrRJ4qBHBqYV2V4S6N/9bUYgcQcq1nDAB
	eC3gYKengHhXeg4vTP+DpxxwkJ31eMlpwVZ49JBkuBFjTaIqTW10gXi3HtAvYLngUt2PT2ntbZA
	3kta2Xc/ZpyjpMH25gUyMftHr/qJxUGVpVEUyeRN3LZQBPvpPOkigqnsB8kQNmaaB7mcXzHXXq5
	EcDyTz/LXuJT7Kkza9o=
X-Received: by 2002:a5d:5f82:0:b0:3a0:89f4:9b02 with SMTP id ffacd0b85a97d-3a08a354841mr82413f8f.14.1745860034380;
        Mon, 28 Apr 2025 10:07:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEmFpXPhy+aEHNqk7Gta9pMNBMcfFrH+kToNbMWgQemraoIGRke3tORh6KFF2FZ3chU73cRA==
X-Received: by 2002:a5d:5f82:0:b0:3a0:89f4:9b02 with SMTP id ffacd0b85a97d-3a08a354841mr82384f8f.14.1745860033933;
        Mon, 28 Apr 2025 10:07:13 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2726:1910::f39? ([2a0d:3344:2726:1910::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca435dsm11620815f8f.21.2025.04.28.10.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 10:07:13 -0700 (PDT)
Message-ID: <f2bf47cf-e789-4f41-aa6a-68adfd887504@redhat.com>
Date: Mon, 28 Apr 2025 19:07:12 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.linux.dev,
 cohuck@redhat.com, mvaralar@redhat.com, shahafs@nvidia.com,
 Willem de Bruijn <willemb@google.com>, Jason Wang <jasowang@redhat.com>
References: <20250126062058.13695-1-parav@nvidia.com>
 <d76dc63e-8d4b-4a90-8765-0148d9c7b885@redhat.com>
 <20250423014257-mutt-send-email-mst@kernel.org>
 <20751ef1-b8e6-4e67-94e5-e8736c3a943b@redhat.com>
 <20250428045124-mutt-send-email-mst@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250428045124-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P0HCPooTkjECcXQgOWCIQ3v859E5q3L697XEyI-XQmk_1745860034
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I'll try to consolidate here the current discussion.

My understanding is that the we are on same WRT that there is a problem
with the current spec.

On 4/28/25 11:13 AM, Michael S. Tsirkin wrote:
> Given features are negotiated first, we can just say the value
> can be 64 or 128 bits? In any case, I agree it's buggy as defined.

Do you mean that the 'offload' field should be 64 or 128 bits long
depending on the negotiated features?

Could that be problematic with VM migrations and/or backward
compatibility? I can't see a specific faulty scenario, but the 'implied'
field size sounds fragile to me.

/P

