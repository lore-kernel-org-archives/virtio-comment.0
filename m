Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8B325D21C
	for <virtio-comment@lists.linux.dev>; Tue, 20 May 2025 06:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723465; cv=none; b=kIP/pngyX0kruTOwB3uLzevEhO/5H7hYQWA1F/7Uh45QPUfUGe+HDjgL3bhIcxG/vMTqcm8S4BbUWoVwIiIL+e1VdHqwj7zQApnwgHKUh4XVD+g+il3t9Q3iVBqjJRDFc3tVOSOYPE9qlrRwQZhVHy2YfOMlXIZK+NJik2O6q9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723465; c=relaxed/simple;
	bh=x0IFjU7K6g6II23nnxvoX14W1sGle0gJBihqmKtmbWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iuSknlbQolqYNnCAYTpYyx6Seoy5nGojtpey+LBsUfoZPGayr2sPQsQYzNA5QrJZqjpfuYvs+IWpmhR138jjhBeQs80r4koBnVWI+H0/IFfrWXh5Hx1FXidfEko6ocrVUzhKKyDRqOlWW3NWtz4MAcLZKf/yP9I/3RNEK6kLQsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GtylDQ75; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GtylDQ75"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747723462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FtDTFVL+LwP0q5wonaG5soYqndNPzydg4q9fb3jeoyc=;
	b=GtylDQ75HEVSmvpX07/jeKgTjASRfwJYMGyTVgR5j77PvkTGFDS47hnmK3W9qCGLlnezIQ
	AYQd8CH1Y/i2j20/RVZJVWiMj5dFuL1IuiH0maOBkWb166PNC2qE3gm6LB3CbSGObslUtc
	i3fg6sb220PJBnORXV3r/qN4vtDtXaA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-3kNcMwsfMqOC2Zmx-fAGXw-1; Tue, 20 May 2025 02:44:20 -0400
X-MC-Unique: 3kNcMwsfMqOC2Zmx-fAGXw-1
X-Mimecast-MFC-AGG-ID: 3kNcMwsfMqOC2Zmx-fAGXw_1747723459
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a360d01518so2984758f8f.2
        for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 23:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747723459; x=1748328259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FtDTFVL+LwP0q5wonaG5soYqndNPzydg4q9fb3jeoyc=;
        b=ck4M72Kh0RupF5TOh6I98KL88hT2rmcL9H8S/q3fmUVGiqy5Jlvp0a9VnyleG/o8dt
         Ygz7OfkY96DVXUElHVdge74t4dQpcbRCYvfU8InXWITeZL5s9IQC+YmNHhdFxaivSU7Y
         S4CUa6D1fcuiz//PB60TcyzkdUqocUlyCVkRfg5xfUDKdmCnzIAXXnPtYF8fU5Rzs/Qy
         jRBrKMktgvfIs7u3Bj+bqqo1a7R06kcbHjEQTaMlS5yvrzJmOs9TCQQmHf5WqzUOTlOJ
         76vrqn+dXVsRuhzlWExMxPjDJ5DW5qms/p1Rr2UvmyM8CPTlyEsN2j+apOn+zDMPzngv
         h7uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg+GZfHQ958JXbpA/yn8pqMRF+PHDPMUpAT30FdkJYd0e4bQGFcf4FVbFxBQtnAVOd2yZwThBhZxTPZhIYKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpLzujxzJm0EluQsILIrU9V+/kGxFSV8avMbcuuSitzvLTtF8X
	41P5YxY+tJpyp2tCWID5RdOUXrQI8rfNYcXFEWj1tYZiIkz7+anBrze8LPWpXupxbC8mLRY4IEe
	HWTMGKzQFLrM58EC/or76L5jyEDw1pTYZgfwD0IGeozmOA8z91dQwTmn8MokFGS0G3UUU
X-Gm-Gg: ASbGncskX2InBEKWAve/bV5FLAEDHZ4fZrPJvkGt1mnI8QaO7aSbo95ghA+/m3V1MmT
	yGYrt+ftj0UBchsNxY1+pO4brO5aeqvzsHStUOTcChYH1Uf5269+qgkduyEvSxp8GM9lR8MoW66
	mI0KhURk+vRF3d1qdyj7mNUe38u/us5bZbKGYdjib+8fl34NO2TYqe4HVejVGMnR3Bt7opH9S0p
	qUzsg4h+GicM7yvPrbhxVZ38wyRBmeC4WSMCqRzfiO8+6LVvo4+K6s05t7FZ/2K7N4prl5Li4PY
	Bc3awAZkZXMjLc8SSt6Qxh+EFmFsCQNDbNbMQpn+y6bSSkZ7oSC+mPjE/Po=
X-Received: by 2002:a05:6000:2012:b0:3a1:4c72:9067 with SMTP id ffacd0b85a97d-3a35fe6751bmr11533813f8f.13.1747723459003;
        Mon, 19 May 2025 23:44:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmgjc7SaZjCOpG3sP9KXUgUtE1JkTDpdttrM6EieaprkdaQxCvdRmky53yJkhiExd4wAshGQ==
X-Received: by 2002:a05:6000:2012:b0:3a1:4c72:9067 with SMTP id ffacd0b85a97d-3a35fe6751bmr11533793f8f.13.1747723458610;
        Mon, 19 May 2025 23:44:18 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244f:5710:ef42:9a8d:40c2:f2db? ([2a0d:3344:244f:5710:ef42:9a8d:40c2:f2db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca888afsm15518205f8f.64.2025.05.19.23.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 23:44:18 -0700 (PDT)
Message-ID: <94d39a71-8610-40d9-bb68-531ed154ff88@redhat.com>
Date: Tue, 20 May 2025 08:44:17 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio-net: clarify guest offloads <> features mapping
To: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Cc: Jason Wang <jasowang@redhat.com>, Willem de Bruijn <willemb@google.com>,
 "mst@redhat.com" <mst@redhat.com>, "mvaralar@redhat.com"
 <mvaralar@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>
References: <a30de484ff56065f56e37446e08dcdfa4850f101.1747649330.git.pabeni@redhat.com>
 <CY8PR12MB719579675CB3864AB3A7218EDC9CA@CY8PR12MB7195.namprd12.prod.outlook.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CY8PR12MB719579675CB3864AB3A7218EDC9CA@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YPCcsm3EfFuxkM_-LvryM9o4x7_X3kFOr5Hjy2G6cEk_1747723459
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/19/25 5:12 PM, Parav Pandit wrote:
>> From: Paolo Abeni <pabeni@redhat.com>
>> Sent: Monday, May 19, 2025 3:42 PM
>>
>> The guest offloads, as specified by 'Setting Offloads State,' use a 64-bit wide
>> space, while some of the corresponding virtio net features are in the upper 64
>> bits of a 128-bit wide space.
>>
>> Clarify the relevant mapping as somewhat implied by the current text.
>> Also rename the offload definitions to avoid referring to different numeric
>> values with the same name in the features table and in the offload table.
>>
>> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
>> ---
>>  device-types/net/description.tex | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/device-types/net/description.tex b/device-
>> types/net/description.tex
>> index 1b6b54d..8c501bc 100644
>> --- a/device-types/net/description.tex
>> +++ b/device-types/net/description.tex
>> @@ -2186,8 +2186,8 @@ \subsubsection{Control
>> Virtqueue}\label{sec:Device Types / Network Device / Devi
>>  #define VIRTIO_NET_F_GUEST_TSO6       8
>>  #define VIRTIO_NET_F_GUEST_ECN        9
>>  #define VIRTIO_NET_F_GUEST_UFO        10
>> -#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46 -#define
>> VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
>> +#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_MAPPED  46 #define
>> +VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM_MAPPED 47
> Since the offload command is defined only for the rx side, in the below 'Note' should it be only 65-66 map to 46-47?

Fine by me. I'll wait a bit before sending a v2 to conclude the ongoing
discussion with Jason.

Thanks,

Paolo

