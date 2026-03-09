Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F39936C0A3
	for <virtio-comment@lists.linux.dev>; Mon,  9 Mar 2026 08:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043439; cv=none; b=Z5uYq/aNuhAurI/p3GekzmN2ECfxd5xIeiX1s88PlGlcuWLA6Jy0rhteyt6SnnHdnasPNC5+j5QYOxXlssYuQNXZRYhaWa/ca+yfVNXN+Q89xwh8H93p2q7bGgEl6qH/3B9nBXYtYTLSZEvCFv3pK4aU2UW8K9geaDPAScLQTsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043439; c=relaxed/simple;
	bh=bThTtgw8m0wGsNjz8SHoYy0Nd9yKhCZ2rQf0C96JgHI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=D4nzBKBukIxPZsMTnfUoy8E03tYtPwJA0xcXp3B2PH5k+PHOSQP0w0qbvoGSWMgKCBGi0Le5DLVNXqp4QUpM5nLAb2KgmLHjicNI+P3BjngPlTQvResjwPmVweui18Cfb1UsDrBVEVWa5Lu3BkwmJLdKGZJdbp/Jr5sfIVONbVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fHK6jCjz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fHK6jCjz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773043436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bCLo5zSjQpBCpLOAfCya/zgaDKlVWcc13iJTazDePcM=;
	b=fHK6jCjzvHd6k9RwKO0tCnBFo0apifchvEOi1vK+Kx/CYRpEIIcGxwdfH9jd6PZuSWivPS
	4VKIVNh/rllh3FhibK05Y5WLXc/aFSfyZTwsZ06c6sHwuLtcTYzGXYr7EHCJUN7/B6potS
	sZkcjKc3b2W3XdS2VtGxY9E9isMy5dg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-znf0ho-hOL-ysMjArkb-kA-1; Mon, 09 Mar 2026 04:03:55 -0400
X-MC-Unique: znf0ho-hOL-ysMjArkb-kA-1
X-Mimecast-MFC-AGG-ID: znf0ho-hOL-ysMjArkb-kA_1773043434
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4852fbfc379so17499645e9.0
        for <virtio-comment@lists.linux.dev>; Mon, 09 Mar 2026 01:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773043434; x=1773648234;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bCLo5zSjQpBCpLOAfCya/zgaDKlVWcc13iJTazDePcM=;
        b=h+FNkCVpoYb8TKMEzB8RP8bvUPjqyxgZhlcsqPoy7zUM/RyPlCGlOZxnvb4NRu7lrY
         kMjivo/8ggQaUkYXvxMN/gA9eSAROiWABgZr9hOsmX/RkzJaceOL+mBsGUsW8eN1szNj
         +mHkM6pc49Hk5Knp+ZloOe+rtewhlEXdKWLwKEllv6bg/LTiXi0buh2SMKOs78gy4OoZ
         iJC1408iI+RFJmV9ZAVrMggIJQOinxwd7K7S3Yzl77gJwCni2KMOzCziH5f8NTOnhhLM
         Fo75m+NT51Fb0gcQNKO+d0vnoAe8t1FBiukuUrL0oGicTEF/gbSIGAsBHuxC4hwMoGFB
         m4Kg==
X-Gm-Message-State: AOJu0YwNMgljuSst27ii+Qu0cpcRHGL3dEUX/N4V7tJcVQt3ihWHgTl4
	wDA/wXhiVouI+dqMQPF8gOqoFj2BvyvIHaLIjXgI6YUKI0e/4McnH9DVPhY/hYZija8TOfSGqrj
	Bb6wu/u7ZFVhZxRG3VjqDjz6KCOqor9Nl5kgIlSJ2COBrCip+iIuynAHeppvEXfR6Zi8F+VBkr+
	vBoG6/u7quiVu8MH9kbxTtDMGYJemu3uSa7rncWvxcqjUmU0obRQ==
X-Gm-Gg: ATEYQzzpUy4qtfZXMoR+8VZXcq8SN0ZgRkVUAzhejsggLfrUQC6VnOAuXH8j0Qo4ZVp
	jypemEXg1xEk8+fU/hKOnL8eH2elZ3E992O24Dd5Ze1hMT0NI8sskILavfhqFyoNp7d+Etus+JF
	uNWjHiu9T/vPWv6MUFI9BcG1XJ5bqBO+vuJqdxLVnJJZuNTMn4+tHE7fl+3tC3M14tqDJebdKZ2
	Z0Nz7lmPvEbopxsLrVPyPw2JZA2zRqqG/3OLzPsvFZIK0TUktM6kk9bwn3FqwDR/JZTz/Igbalm
	spf0Lq4Lo5GXJ7gq52SLUR7nBAe7NSt7JBLBUd9TBdP6rQd7u2p4IqhqiT8YFnWkvqRmoMNuuOo
	xdLOzJ/kMvVGZtIP4xFBYB5/2r3qenhI4AAgcaNtvlyH8544scmYQs7SY
X-Received: by 2002:a05:600c:4fc3:b0:485:3692:e906 with SMTP id 5b1f17b1804b1-4853692eacemr70376115e9.13.1773043432234;
        Mon, 09 Mar 2026 01:03:52 -0700 (PDT)
X-Received: by 2002:a05:600c:4fc3:b0:485:3692:e906 with SMTP id 5b1f17b1804b1-4853692eacemr70375495e9.13.1773043431664;
        Mon, 09 Mar 2026 01:03:51 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853a946978sm86050495e9.1.2026.03.09.01.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 01:03:51 -0700 (PDT)
Message-ID: <561fbba3-ea26-41e1-bb83-23fc0e1d5110@redhat.com>
Date: Mon, 9 Mar 2026 09:03:50 +0100
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] virtio-net: clarify guest offloads <> features mapping
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Jason Wang <jasowang@redhat.com>, Willem de Bruijn <willemb@google.com>,
 mst@redhat.com, Parav Pandit <parav@nvidia.com>, mvaralar@redhat.com,
 cohuck@redhat.com
References: <6af50c9ada76d8168d248827e4af7c44bdfa34a8.1747826378.git.pabeni@redhat.com>
In-Reply-To: <6af50c9ada76d8168d248827e4af7c44bdfa34a8.1747826378.git.pabeni@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QkoTa5vF5xRu6ul6YtIYNxn5cJWwso5entX-6xd5abg_1773043434
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/21/25 1:20 PM, Paolo Abeni wrote:
> The guest offloads, as specified by 'Setting Offloads State,' use a
> 64-bit wide space, while some of the corresponding virtio net features
> are in the upper 64 bits of a 128-bit wide space.
> 
> Clarify the relevant mapping as somewhat implied by the current text.
> Also rename the offload definitions to avoid referring to different
> numeric values with the same name in the features table and in the
> offload table.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/225
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> ---
> v1 -> v2:
>   - restrict the mapped range to the guest offload (Parav)
>   v1: https://lore.kernel.org/virtio-comment/a30de484ff56065f56e37446e08dcdfa4850f101.1747649330.git.pabeni@redhat.com/

I'm sorry for the very long delay here. It was not clear to me I should
have explicitly asked a ballot on v2, too. Let me do that now:

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/225

I would like to ask a vote on this issues, thanks!

Paolo

