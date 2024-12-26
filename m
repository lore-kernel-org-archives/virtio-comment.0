Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B4E3EA98
	for <virtio-comment@lists.linux.dev>; Thu, 26 Dec 2024 03:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735185134; cv=none; b=KSDKa1cw+rD4AiuwIhbv9rQjYI1ZfkZw07PvAQOACHw+ZPjWaoIhA8iVm4/RT25q1PfpjlaAvjBsakOAecznNWPlid9jMgufi5CMMWly0WMdPUNOmMbLh3aYFwo7H9hGmJj9k5m3IBH538o31Dj+k4ikhRi/qsDsOFsAI2vVKLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735185134; c=relaxed/simple;
	bh=JBkY+olhC7w4l5wTJMZ0EM8W1zY5pWTUCgTVF6kVoQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ryDYup80rNzhrTgZvkDgK2O/N+6FbuL1Jtui7dJPoc/4qmNwViPlrLWaHLsOHHZrGiSB0g6CS5RwErYapL6RREv5dAmERijfANZFyPY5OSaQltGYu/t/o2pnaAviFZTEJxAl7Ld4Nvdg8+qqxBPkVkl1rEdqNfiEyaCBmjMWzoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=f0WOq0Rd; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="f0WOq0Rd"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2166360285dso69663405ad.1
        for <virtio-comment@lists.linux.dev>; Wed, 25 Dec 2024 19:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1735185132; x=1735789932; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oAis7LdyrDg9eO+x10DzK/kQNmZKIvzPAHOtMDTJ95w=;
        b=f0WOq0RdaS6UzEgJjzSHsEwusg3++YPT6rW/A2pYStnEt5zMiJ4vo8Ge0EYpuxQ5FE
         EBscqMqFn6kjbKz9PKxurgBkQ0VJgB5dijScuwczW033wHtCKKJcARocHjZyRs4NISOK
         oKPZw37CgcItEV9egDJdRgu60gUJJSQMP2cNmJse2r4Bs3oqQRWgZ85Kvz3AmQCM5++u
         td17P+SKb8uqaix/csVUAl/gtKNA7gW7BWcysxVxJqIvGmL3VmsDIEa+DOTceSub0JxX
         hgkRUjG8BOZ7jAMyWefC2yzlkFhyrbsQBClWUgXUs4beeOvMObvUDnYqDNm9znfMTDlF
         XBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735185132; x=1735789932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAis7LdyrDg9eO+x10DzK/kQNmZKIvzPAHOtMDTJ95w=;
        b=qGK5H1HWFiIdFKNAvo76//5578j/aZrSQlhFsnLekVo3MC8DtlcgINrH1vOHhTgUAy
         xzHRdKHxUm6/u/YsHQ8KH5A0aJbpJrWKQKhHCmR8jfcLgEknce3mo8QpsX4hhAElINPh
         WHUs00VhLIXCvhNwiPJiBNwXS7oIjWexj2tDWwHA68z0q8NbSEmtFs1X6vxWswUZIqxS
         Afif7H1mNWwHz/jqCf4sYIE8Wj8y5MVh7Qms5Fc7+zqhYf1CompMZVyvxvoWzMyJBEaT
         4RP7WN/KgyZ00fciXy7JaHFowW0PqekxWUC61i4F+msaqkM2gQ4KHONDsvOJadoEJTm1
         2uwA==
X-Forwarded-Encrypted: i=1; AJvYcCVubXp2BDTt4MMpJAIc58QNulpvZ2OasKBDH8ch4w95cRv9KPhE6DuptJ7OqtcQ2p76UciHi4Wjm3njHUzE2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwX9/o6a0dw+jRmyMPg9yt9gVmvuDKMOU0rPk0Eta8mkUgGq+l1
	srY3ZSPoIiLx7JKjN5XGGr2Xd7WIsJ+1lpsr/362Uv+jhD+8mZLXKzhX9n1Qdrk=
X-Gm-Gg: ASbGncsszr72/trkfg5ekmsCOPVVV11x7Gr45O5vcL0WhI+HqWeTJS3LUSDQ1+E5Sow
	7sk/1D1QHj2xRwibKJo2ivVHe62MvbPa20qH5ANSTWHEgKpXwAvckYVfDZNtqL1IkraHte9O6p6
	El9dN3aHDpcWklS6Yfvf6zhhkk68ADZ4V2cjf4jboqPvSM820aCxOijw2HiUi1dB2KCGWbzNbZ5
	V4T+2P+r6mg5pkfogPOJ6R2oTkCUcCM2Hff9YG0Xb0d4WPNfA2cMdiB3WuDxclVhOMfjA==
X-Google-Smtp-Source: AGHT+IFDXzZntw1eG/GmTgYqwry+fOoVxOeDNnpwLZOds+31DN7Cawm1nEELc4xd5SdqgP/pKzHpqA==
X-Received: by 2002:a05:6a00:8c4:b0:727:3c37:d5f9 with SMTP id d2e1a72fcca58-72abdeff523mr26882609b3a.26.1735185132017;
        Wed, 25 Dec 2024 19:52:12 -0800 (PST)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fb9c9sm11972746b3a.155.2024.12.25.19.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Dec 2024 19:52:11 -0800 (PST)
Message-ID: <dcb6ad57-5d36-40f8-b161-7570dacdea4a@daynix.com>
Date: Thu, 26 Dec 2024 12:52:09 +0900
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
 <24facd94-87b2-45d1-97ca-851595e8cf41@daynix.com>
 <CY8PR12MB7195C2A20025389351D15B8DDC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CY8PR12MB7195C2A20025389351D15B8DDC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024/12/26 11:50, Parav Pandit wrote:
> 
>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>> Sent: Wednesday, December 25, 2024 12:01 PM
>>
>> On 2024/12/25 15:28, Parav Pandit wrote:
>>>
>>>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>>>> Sent: Wednesday, December 25, 2024 11:52 AM
>>>>
>>>> Linux's vhost_net and QEMU sets num_buffers to zero when
>>>> VIRTIO_NET_F_MRG_RXBUF is not negotiated. Change the specification to
>>>> reflect this reality.
>>>>
>>> Please fix the vhost_net and QEMU to reflect the specification which clearly
>> writes num_buffers must be set to 1.
>>> (the last hunk of this patch).
>>> One cannot suddenly change what was written in the device spec as 'must'
>> requirement.
>>>
>>
>> This proposal is based on the discussion happened during the vhost_net
>> development:
>> https://lore.kernel.org/all/CACGkMEt0spn59oLyoCwcJDdLeYUEibePF7gppxdVX1YvmAr72Q@mail.gmail.com/
>>
>> The reasoning here is that vhost_net and QEMU set num_buffers to zero for
>> years so changing it is more risky.
> Less risky for the device or the driver?

For the driver.

> Your response implies for the device, but do not understand how it is less risky for the consumer of the field (driver).

If there is a driver that reads the field, such a driver is likely to 
expect zero because the two most popular implementations sets the field 
to zero.

> If the field was never read by all the drivers, it is better to modify the spec to say following in the requirements section:
> 1. device MAY set any value, or MAY NOT event set it.
> 2. device SHOULD NOT set num_buffers.
> 3. driver MUST ignore num_buffers when VIRTIO_NET_F_MRG_RXBUF is not negotiated.
> 
> For the real PCI devices, this actually can save the sparse DMA occurring on rx packet.
> (telling 0 forces the device to do the DMA for the field that driver ignores).
> 
> Also please change the motivation in the commit log to indicates that dpdk pmd, freebsd, windows, Linux, QNX drivers has never read/honored the field num_buffers when VIRTIO_NET_F_MRG_RXBUF is not negotiated.
> Hence, make it optional for the device to set it.
> 
> Please work with those open and closed source driver's maintainers to get their ACK on non_usage by the driver.
> 
> This change will help to save the PCI DMA.

I don't think it will save the DMA because it is at middle of buffer.

Regards,
Akihiko Odaki
