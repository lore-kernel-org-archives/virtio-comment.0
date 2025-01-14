Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCA6143C40
	for <virtio-comment@lists.linux.dev>; Tue, 14 Jan 2025 15:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736867084; cv=none; b=oQUWaW/EUVq8ngtzELrt+rKSq1IitSyDEgE2z1klnTJqlemXxH63V9Hy8w4ZKUYDafN89lErbLhn9I3VHHKcVx/eMfbZrr6QsfqbS9LbTFdsfK7lyVoYToZMkPuJm3bOmjRH/TOhwFHXWyDEJrGHVvaZe+gPBojr4u+JIsrE67U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736867084; c=relaxed/simple;
	bh=Y/Yeo4QJgqQDV+Ll9VnHcd7xpMTZ/qvWXemE0a9JHw4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XDbr3OzGWYgIc+FPv4kpfmWAfKJ7wtEs13hYm0j6znVUbSLNnDZToKN5D4yLMEeSdaY/EAe/rYd/uu5Rxs02isy1zm62/4IjXX9besDrknEb0zSy9NasjgRBbHWzJV3NlRPEQqPOhXNjCLT5nWxEcDbBF6QsfQpclLpIfU79c7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IXucjBiW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IXucjBiW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736867081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cB/nC9KSF1EBjo03LWsjENzJpx5PHYvYwRT7Wb1JrvY=;
	b=IXucjBiWBpi+svMCuEeTqYrG2q8HFuIk9J5hNikNf4hn/bEZEDn+jUqPCGV3+xnyqxRc2H
	+RQNNvgO40Qy0KeF3/8fWfpG99GwyQx04i7HKYKB3aeOPOQH0S6/QYomgzli37lljT2Qg9
	kyEhmhhncPj5xOX2XqTyiop64FiefnI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-KJBouJ7VMRW3RZew1x2rKQ-1; Tue, 14 Jan 2025 10:04:40 -0500
X-MC-Unique: KJBouJ7VMRW3RZew1x2rKQ-1
X-Mimecast-MFC-AGG-ID: KJBouJ7VMRW3RZew1x2rKQ
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-436723bf7ffso19390865e9.3
        for <virtio-comment@lists.linux.dev>; Tue, 14 Jan 2025 07:04:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736867079; x=1737471879;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cB/nC9KSF1EBjo03LWsjENzJpx5PHYvYwRT7Wb1JrvY=;
        b=B8hMG5Z+o2dWVSl7Njn3R6d/OIY/18oOIrFUylWd9wKROSzlp/ZGaaLJCMFDkqYylN
         UGy/LQmQjcKJnP0QiCHS0DnGTShThBRF/IG4z3G7AfBSKudBsbzSmGsf9p+EG/89PqdB
         3hjY8pv5/YHB1dLzRQroyaw+HRooyEhSjJ7wvVFhEjd6xrQgH/67o9ezNAMefUvvPJE1
         hImjBjnImIeZ8fp+zjRz0Cyo4abEwp4PGvHugvF3jA0xWOybIENMlm3v6q3ZnX6UjfQX
         nlD6Wp84gcw0jDRsa7aEL3S9CaHnWEfVe8OWdL+OOZr/JX9lu9y7XbvHew9g29Q82fO4
         wKZA==
X-Gm-Message-State: AOJu0YyKk0og+OoA5U/2gmtoX6yPRflYsczqdan1zlD6/TkuTOaUv3zu
	Qv+s/TIp0yMVDM9S2A7rf17PJXEwXRLpBr4Hr8i1kytHkRVV/Gjan2tk4UT64ULRqkaaFl1tPwS
	6ItrEZC4Xy8LhURUWYj7xa+XKKU8XT8CWSP8LI3ua/FKzIe9bQwZTAt8jzGx2V4WrN/ZNFdclIq
	6vN8m9dGD5LfQ+WyTqvLZuLw44eH65SqBjzuW9deiC2R17Lw==
X-Gm-Gg: ASbGncsgT5PKpiatGnE33tZ2H7qL4AQ5oL4r8DovbQ84FKsngJ55W2xTtqajbHMf1rp
	t0EQxZShvP4DJzBaWfueTgeX/U2aV4AWLEIRzeeTKP8kteh6StRiI+89RvT4jWVpfUhJ53+K+DW
	eNaysTg/pAZLrn0kK+cbVxX8XJbRngX2ojUCbWUmmU9wOtZrblImRsUsqDm1cWXuCcNI2oXBJcE
	Wl/FHyGR/HJj2xW/k3l/7+O3Er+obxrHxK5vHKgX4/OIyGQXNXRH2Z+Qbv8QieyppoQ/24lnTdx
	PC4VDM0hW6E=
X-Received: by 2002:a05:600c:54c5:b0:431:557e:b40c with SMTP id 5b1f17b1804b1-436e3fb231cmr210775525e9.27.1736867079312;
        Tue, 14 Jan 2025 07:04:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbN36KdStey4gFJlP/0uMUPZE9zoBlOV0fJEyaXin3O+mpKDzVLzl0+Z18X3ZW1C0RRupTgQ==
X-Received: by 2002:a05:600c:54c5:b0:431:557e:b40c with SMTP id 5b1f17b1804b1-436e3fb231cmr210772875e9.27.1736867077167;
        Tue, 14 Jan 2025 07:04:37 -0800 (PST)
Received: from [192.168.88.253] (146-241-15-169.dyn.eolo.it. [146.241.15.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d040sm14797304f8f.6.2025.01.14.07.04.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 07:04:36 -0800 (PST)
Message-ID: <175a0b29-5901-4393-9390-64a018bec260@redhat.com>
Date: Tue, 14 Jan 2025 16:04:35 +0100
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/4] virtio-net: define UDP tunnel offload
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev, Jason Wang <jasowang@redhat.com>
Cc: maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
References: <cover.1732699986.git.pabeni@redhat.com>
 <fe15607a-1431-438d-956b-bfec70e94507@redhat.com>
In-Reply-To: <fe15607a-1431-438d-956b-bfec70e94507@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vkrVMiGuZKyjn0-DuyAcx6RTeX68Hm-0Egzay0079OA_1736867080
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/27/24 10:48 AM, Paolo Abeni wrote:
> On 11/27/24 10:36, Paolo Abeni wrote:
>> UDP tunnel usage is ubiquitous in container deployment, and the ability
>> to offload UDP encapsulated GSO traffic impacts greatly the performances
>> and the CPU utilization of such use cases.
>>
>> This series includes:
>> - clarifications on the current semantic of NEEDS_CSUM offload
>> (patch 1) and DATA_VALID offload (patch 2) to make later changes easier
>> to follow,
>> - new features definition to handle both UDP tunnel segmentation
>> offload (patch 3).
>> - new features definition to handle UDP tunnel outer checksum offload
>> (patch 4).
>>
>> A PoC implementation is available here:
>>
>> https://github.com/pabeni/linux-devel/commits/virtio_tunnel_gso_v10/
>> https://github.com/pabeni/qemu/tree/virtio_tunnel_gso_v9
>>
>> Note that both implementations has not been updated since the previous
>> iteration, since there are no additional functional changes in v11.
>>
>> Changes from v10:
>> - added patch 2
>> - clarified only a single encapsulation level is supported (patch 3)
>> - s/TCP or UDP GSO packets/GSO packets/ (patch 3)
>> - 'to the outer UDP pseudo header' -> 'to the outer UDP pseudo header
>>   checksum' (patch 4)
>> https://lore.kernel.org/virtio-comment/cover.1731084277.git.pabeni@redhat.com/

I understand all the points under discussion have been addressed. I'm
wondering the next steps are and what I could do to move things forward.

Thanks,

Paolo

