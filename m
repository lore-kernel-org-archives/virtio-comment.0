Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48415256C7E
	for <virtio-comment@lists.linux.dev>; Tue, 20 May 2025 06:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723176; cv=none; b=N4gR25jH5AQyEabFU7IY+imya6QA6dlzdgR5OGKS9Acm9O9fvXcnAWW4SFGuAGLswC4hE6Db306GKNDn+fuBZ08YuXCZyWi+VxBxsvjCcdKZ6sBE1aGNy+ZbwxVXEkehS3EZsHh6yqE2OjjE9bjWpvmZTHlIhatAus9a+AzVXY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723176; c=relaxed/simple;
	bh=XgLizqxyBbvE8sIbiR0HKydtThkzIsRow1AUnoPq+ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rbwdlAzUw1VkPfxZj6bvf3+Cy+/0/lMFoQWpQQxnVDJaWAUvv5sNtJ+ajZL428lQkhhmtsOVRYQe40oTR0iurf1QvS/rsedGcqFEZe4CMi1bG7DYyrOuceUG1iQpd6qtPa8zXHq//rTi89IL0k3QlH1YOWmpGkgr/1l84ERhNzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ChhIgJP3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ChhIgJP3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747723172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iCASrh2WKH9A+qLKIfdkaSlwOcg5hvW9Itn0R/XQ830=;
	b=ChhIgJP3hsN/iUKeb8PwAbAgcITBl4xaC5TnIdyoGnZJIzz0O/FWWAFRxv2iSYjH4GlOzP
	euCubtcyfFNtehLd7fbv0xAc5J1B7JQmYuwsjNM3yPzuTxt56RXKZ6/+jWpPY3chC5HYHB
	OVOPiJ3spqrmypcpS1d7YSv3RrIDTlU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-nR0gee1YP6qZH8uT6GyPJg-1; Tue, 20 May 2025 02:39:31 -0400
X-MC-Unique: nR0gee1YP6qZH8uT6GyPJg-1
X-Mimecast-MFC-AGG-ID: nR0gee1YP6qZH8uT6GyPJg_1747723170
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so32822645e9.3
        for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 23:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747723170; x=1748327970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iCASrh2WKH9A+qLKIfdkaSlwOcg5hvW9Itn0R/XQ830=;
        b=GDOAbBG9HN9nrEpLMSDSQrSY5y+8y2mC2uXvfAHjQe0iTmU0yKzMHfI9he2yx8bS7R
         OLpX33kik+g09NN8FQM5QfQlM8n87u4Uz4Cf7pLwdEAXpG1vhC4lTZSVMcLESdAzBb4i
         WaqygORAL4rVj5kGCRKLDXS7EO4hswE7fheTMkRSdkzxoVqfwLklr58e45ZwfeMMQCxH
         7Usifu0+OpZENk8mP5W5S3KFoocjABvh057r7w5hknV20nktzmfIG9O2DT8gN6+zDXlG
         qHkSchRtuInUMgiCFKpGp6QW6KSKDoU8whbs6RE+XY+waElzzY9+pzyvzKiRjcOXY7o2
         EUQg==
X-Gm-Message-State: AOJu0YzD2oogJ17/EiWvfUmVFMR986tUjbXMYjAVDxdenNEz+BejMP3K
	kdV2RxcpD08zEvMMMEiPzAMYijjZOdpnmhrfY99QUKDe5JILGCsOlvMRaJEH9kfh7hXXSxhCc8U
	EJK1CvhvcTkb2RmnuZj6Rky1VbMTJZxM/ChjXKYtyrJU1qwGbGo3qyZO0pZNyfTo0vN4m
X-Gm-Gg: ASbGncu+RW90TOtdbH4YPTgSu+91cN1SsOa4jnmjfY35piEt8He49bNuyaD2+YYvL8D
	4bRV1Hn2IffEHLHOpCkiIsuP7XjeYYT3apBnN6scGl5wsWGkDJHJZqud8eaJyYu3C90iSuZxfOX
	ZTiGw1WIF0JJteWmK50ibApQQh968CcNOIdQwh8lz9QNi3H0PY7RbxVBlrJkRaL5eWWX+ezxicR
	bOX/QPVE9Pc03/zSbEQqC1cqJGDVerG/JyYjRrTK724LyHq1SxA34vumjyrwzz2Q+0ykQutkNrs
	h9iIrKQOLteRiIipwKfoCoNdA5fiGCmus7fsCF7zucQ2SgzTEke4Z7n/wTw=
X-Received: by 2002:a05:600c:c13:b0:43d:79:ae1b with SMTP id 5b1f17b1804b1-442fd627416mr144235825e9.14.1747723169853;
        Mon, 19 May 2025 23:39:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlQ/FvlqMD76qlcfn/iWDbdGWEA+Jk3G1PVSigmHeHtkfNgNJX/4Ylt1kZzJU6oLAEuHwXFg==
X-Received: by 2002:a05:600c:c13:b0:43d:79:ae1b with SMTP id 5b1f17b1804b1-442fd627416mr144235635e9.14.1747723169499;
        Mon, 19 May 2025 23:39:29 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244f:5710:ef42:9a8d:40c2:f2db? ([2a0d:3344:244f:5710:ef42:9a8d:40c2:f2db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef032esm18400425e9.9.2025.05.19.23.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 23:39:29 -0700 (PDT)
Message-ID: <9c742c68-f673-4145-be97-f7528055ddf2@redhat.com>
Date: Tue, 20 May 2025 08:39:27 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio-net: clarify guest offloads <> features mapping
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, Willem de Bruijn <willemb@google.com>,
 mst@redhat.com, Parav Pandit <parav@nvidia.com>, mvaralar@redhat.com,
 cohuck@redhat.com
References: <a30de484ff56065f56e37446e08dcdfa4850f101.1747649330.git.pabeni@redhat.com>
 <CACGkMEvyLNKn7_-bfXAEog5vMK9yz7Ms__HUTjH6cy+tdfHA+g@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEvyLNKn7_-bfXAEog5vMK9yz7Ms__HUTjH6cy+tdfHA+g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lfwmDOhQ-uNQ95alwM006ouVMWKvw_HGmXECzjym5dg_1747723170
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/20/25 2:50 AM, Jason Wang wrote:
> On Mon, May 19, 2025 at 6:12 PM Paolo Abeni <pabeni@redhat.com> wrote:
>> The guest offloads, as specified by 'Setting Offloads State,' use a
>> 64-bit wide space, while some of the corresponding virtio net features
>> are in the upper 64 bits of a 128-bit wide space.
>>
>> Clarify the relevant mapping as somewhat implied by the current text.
>> Also rename the offload definitions to avoid referring to different
>> numeric values with the same name in the features table and in the
>> offload table.
>>
>> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
>> ---
>>  device-types/net/description.tex | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
>> index 1b6b54d..8c501bc 100644
>> --- a/device-types/net/description.tex
>> +++ b/device-types/net/description.tex
>> @@ -2186,8 +2186,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>>  #define VIRTIO_NET_F_GUEST_TSO6       8
>>  #define VIRTIO_NET_F_GUEST_ECN        9
>>  #define VIRTIO_NET_F_GUEST_UFO        10
>> -#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
>> -#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
>> +#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_MAPPED  46
>> +#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM_MAPPED 47
> 
> As the introduction of more offload features in the future, I wonder
> if it's better to just avoid reusing feature names here.

No strong objections, but than it would make less clear the 1to1 mapping
 between offloads and features.

> For example, rename all here to something like
> 
> VIRTIO_NET_CTRL_GUEST_OFFLOAD_TSO6
> ...
> 
> Or introduce a new command to be as wide as the feature bits.

I would prefer to avoid such additional specification and code churn,
especially given there is already a lot of stuff pending due to the
features space extension. Note that the benefit will be limited, as
there are a lot of bits available in the 'offloads' field and we could
easily map more features, as needed.

I think the new command should be added as a last resort after
'offloads' space exhaustion (hopefully far in the future).

Cheers,

Paolo


