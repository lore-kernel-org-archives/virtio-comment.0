Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0855A8836
	for <virtio-comment@lists.linux.dev>; Wed, 25 Dec 2024 06:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735108268; cv=none; b=bj9J8QXYA6a/RlAroJ3z6a1SGaKeNPO1i55pzAEgNEzhnYNmUs6Pw+AI6FV6GdBG2S8fuNAMGnVLCUIoSV5kS/DZCdrh44zbUKA7K8NcEUXteAC9woEmwdATQafFkkBJJQA3cKZv+vvx5BxVT9YL7SIMwJU5SJElGpcAXH753to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735108268; c=relaxed/simple;
	bh=jGpq9LUJkWGp8G9sjNgv3lIj7aR5FexzIc6y55/dMGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hWL3jIgOALB2+G3PY2RfY0CN3bE4w7fGGn0ptY9sEr6Er1hT2ltdPfZk/LoYOFrGWSwNv+NHtfoUGn0VtOjik1wtPmiQtyrHqBDQ+zBAMT5wiV1x71R/bVVPsCEWIRCCpnq2joW1rcbJqtSwnP/4pRwZXCTRk14ztTfRg6d1vzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=m8rRhy6d; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="m8rRhy6d"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so5914476a91.3
        for <virtio-comment@lists.linux.dev>; Tue, 24 Dec 2024 22:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1735108263; x=1735713063; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TlVgcF3FC87jfJXDmTPk+W1FvUeql/RnzYetugV95RU=;
        b=m8rRhy6dipdK2pIu8Bo72jRqJ3t/tfrhR4jZ5o+ODQ0Aly1vHCOTNuB6BOLldLvni4
         GLWuIKhE9pbcDP7JCLjes8o5wcuHV7hMKxocxlOgH5uPwfkHr1YLFkSFnk+unWkGpsSa
         8AJAfggt8wioHICjr+WFyuNwJr6LiSxKGk4fI52+D8cdKfDs9RiMKDlc+KPsKqTO8Eyh
         mwb2ICQyawhh28yhj4O6OJnw3+o31tByeaXlil8Gty5nXjviItyFexZWIIqYmNyl9Fke
         ePF/UmQEcOiW/44b1o2U5B/SCvLfPl9j/eO+WyIJtpSHWznTJAbDAUm1D0bEeEmUHF6w
         1sKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735108263; x=1735713063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TlVgcF3FC87jfJXDmTPk+W1FvUeql/RnzYetugV95RU=;
        b=XuEECXLLZBbN1seVaRiZpaKly0oXzqLCEoD9hesSRR5LXBk7nNK8u45qmNaE7qXARS
         /3rK+ZcomZQd0OiN3MzHqkXPkGP5svMta4J7ehGnumlBGIXUxteYTXK6BerbE8GZ1okB
         jY7TdqZxRH12+obwdcaP0BWMfNW2lQ78KHZvyPyKljprPHlFvW39PT5cdOYzPlg2NN0h
         r2/583CSZhFxng2wO0r1MP19cdVo0jXe7jLXBe1/Oq9qEY/GPOxeSsVOIJ+WQKk7BeMy
         8JbrVUuZonIvMzLDv6PB8dCrkJq8llzr2VI89B+QedSyKviTE+vgjvZTnB1abj2fxInt
         y6BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHggaNwFT6VPhAMYMdHKUmtTqa0/neVTwsI5RleM61hB74KixwZyY8VhfosAjohr/xJixTRx6TVYA/medUIw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHM5snoBjoTvhG7+gXp+TBT1CAvIBZjy8p9+tEAIfuzEwJzOwc
	ue7749sNrpsgKeQz0CN6x20ZoenUAEFm8YlK6lF8ogB889SFDTK3a0sGZ7vZqeQ=
X-Gm-Gg: ASbGncuRXqLRuuPGqLOqmlsxDuiKfslRY31KXo9MXJi43sSeSXSZP6jeE+NHmKgZh/p
	MzvJg+viuvJHWN9IdZ/IfWO4+OdLm1GxkZmisiGmzckc2ZQ2fjOCqffZwcuprg3D7j9krzj2LJ4
	s85o7R97eWNnIEAIjmuMPbYJS2+k2C6nk4M9qGnaNCxSASSpG3shRV8eEIF7zAEirXeccsyqTI9
	2/G0T4ZQsdh0pi373xRxYfRDEHuPOH3aKBxizDLuISObgfevQ54iayTj+YEBZaLpZhHNA==
X-Google-Smtp-Source: AGHT+IG+z7Kej2xe5nlnTut7Gg0GndbxFIWSczfzYEtMOdZUABFgkI1bCJklp4QDkA5/Z5jll13i4g==
X-Received: by 2002:a17:90b:524f:b0:2ea:bf1c:1e3a with SMTP id 98e67ed59e1d1-2f452e2259emr35450776a91.12.1735108263248;
        Tue, 24 Dec 2024 22:31:03 -0800 (PST)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc962dc0sm99364615ad.32.2024.12.24.22.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2024 22:31:02 -0800 (PST)
Message-ID: <24facd94-87b2-45d1-97ca-851595e8cf41@daynix.com>
Date: Wed, 25 Dec 2024 15:31:00 +0900
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio-net: Change num_buffers value
To: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "devel@daynix.com" <devel@daynix.com>
References: <20241225-buffers-v1-1-712e839e8ad1@daynix.com>
 <CY8PR12MB7195705CAFA8759355685905DC0C2@CY8PR12MB7195.namprd12.prod.outlook.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CY8PR12MB7195705CAFA8759355685905DC0C2@CY8PR12MB7195.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024/12/25 15:28, Parav Pandit wrote:
> 
>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Sent: Wednesday, December 25, 2024 11:52 AM
>>
>> Linux's vhost_net and QEMU sets num_buffers to zero when
>> VIRTIO_NET_F_MRG_RXBUF is not negotiated. Change the specification to
>> reflect this reality.
>>
> Please fix the vhost_net and QEMU to reflect the specification which clearly writes num_buffers must be set to 1.
> (the last hunk of this patch).
> One cannot suddenly change what was written in the device spec as 'must' requirement.
> 

This proposal is based on the discussion happened during the vhost_net 
development:
https://lore.kernel.org/all/CACGkMEt0spn59oLyoCwcJDdLeYUEibePF7gppxdVX1YvmAr72Q@mail.gmail.com/

The reasoning here is that vhost_net and QEMU set num_buffers to zero 
for years so changing it is more risky.

Regards,
Akihiko Odaki
