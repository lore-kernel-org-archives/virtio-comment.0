Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0095D477
	for <virtio-comment@lists.linux.dev>; Sat, 29 Mar 2025 08:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743237147; cv=none; b=epQx6W/A/LsUs6vx6atOK6R3NBZmgx50SdCUFNBvSbWRaRIO7OjYj2/l7Ep/86l7x1s5gEEbPSECDX2eFcOa+bxunsZ16tHth2KPoRW5hL89yT+/qs0/tQuJK2X49DQGR/M0K58BLqEMePu/kbt5Pzilzhk1T7vHkOq0aPcqDt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743237147; c=relaxed/simple;
	bh=+bhI5/IsJ2+s9tR+eU394Q5wI0zqnkCgrxXAzfe9Tvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ftZuZZJk8ziKzhGhF02DNFcGJzEE69iN89n54ktcqrX/nWYEauY1u4gCp0TdGG8pdytowEFuNtBjojqvw9Sxx/FBWG+x/cEmhkRVuhYalxs6lkdomp8AswLSxCzuI4UHv3ONVz2yQqa+S5WXaPWWBALzmWMxjEYhJ2JRwvfHRHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=lGx7hD28; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="lGx7hD28"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3015001f862so3727331a91.3
        for <virtio-comment@lists.linux.dev>; Sat, 29 Mar 2025 01:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1743237145; x=1743841945; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lUXPiIGluxcywRJWFYNC83C/spW1mi6b1dKhO8r0qYI=;
        b=lGx7hD28/C8Fz4pEhvDeL00Bt2Y0iHmaGo15jQcNO1U7BE5H+pui0u+HK/Z9iknm5z
         ygzeD8f/xhfQCRa7/0W2z2gaMJCcMC8XhIXFmiOTsHB8IQRaUvFBOB4JiMEAlFoXXkd5
         gvdlXdFplCyhDxOgx5ut+DI7TKXqh0ITpO9X0weCQxvocfG1wz/F0rKxJzajxHWH7WDH
         SHqLL21QS+40UM5J/xJvwkKomlh4CUBp6U1qfupvp4FQjX+nW5MUzmbRp0mfLrY/vU4J
         fzMkyJ3uqA+ylfOTksdD89Es9MLzvZQuInBLfUmSI/SjhhiZ1C9zv8e9BbqhYPXoDxBB
         SzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743237145; x=1743841945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lUXPiIGluxcywRJWFYNC83C/spW1mi6b1dKhO8r0qYI=;
        b=OUpOOvDnsw/XZQFMZ6MZxblSbHH9mwTSh0X59PoGFZcdcRyYV3mVLB2AxBEU7v9/ME
         X9KDqF9/SUMtJ8tIUe0vK6fYHuCEyap4ut/mdJKmgIDqkPX+mUSwmbxzsnVWZwi7vjPD
         bgOq4kwo1lXfmLiphMcEjuDhWfKLOUeFh1BgXzdOhMDAPNrhY9VUrqZfkrE3nwOlLjNE
         usnRZERVFSI8jaMInuat7vo18QSA4KSBHjsBccGz+rGgaJR+qIl7qxYo/ryc08ylo8VM
         usBX50VfSQwIxwtwP24P2XJRTjSxORLH/GzEU3oQQ7LnYEe+gJfNS2Ps5O7/HQdn9yIy
         5JiQ==
X-Gm-Message-State: AOJu0YwyN72PUKHQkR46E69+l9HlUXvFnCq3PNWZ4Dxn7jaWMrS4FCDU
	jV2wQQNxynCosliVeLQ+RH14dkJXAZp2EhGZh3pWniOBQzbF4VptRvfXQBE4ms4=
X-Gm-Gg: ASbGncuoL7QmTVTfjfOPelRSo67cP6ta4clleZkvnqMGvGM3onQPSzg3ei91kR8BwL9
	n3eji6XXeJ+tJR1MqrK80ToRxarzrfZ9ANEmffjY17S47Jn6oGTWHmqw086w1AUHWERLs3YZVjR
	8vY/oME35eJoIAs9MjbEiPe121wDcmbiA+mukW+ulUyelrJpVyZaVavNS9163+5VIjhxnKHR6MW
	UW6+b7JxYgXqh0QI8CNulILH67mqY+yQSb/BWl9BoI2s+1d2hQmBw2YpPmVqOPV/9Qma3NjLwjI
	1aw0B7Da6nYgy/i1swhEXzKrC/0tNwG8LRTwysRX29J8/eqJsF2HAL09BA==
X-Google-Smtp-Source: AGHT+IG9QIE84Ak8bfZ5yRV55fbZVepb/bU6RYtFeyCSMJ4pEUOPyIp996BL2oGDUpVLj92hIcQfQw==
X-Received: by 2002:a17:90b:1f8b:b0:2ee:b4bf:2d06 with SMTP id 98e67ed59e1d1-305320afb06mr3209180a91.19.1743237144747;
        Sat, 29 Mar 2025 01:32:24 -0700 (PDT)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30516fed701sm3194975a91.38.2025.03.29.01.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Mar 2025 01:32:24 -0700 (PDT)
Message-ID: <afd70f86-a248-460c-b82f-c3bbbf62c0f1@daynix.com>
Date: Sat, 29 Mar 2025 17:32:22 +0900
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio-net: Update the max_tx_vq description
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, devel@daynix.com
References: <20250321-tx-v1-1-dd21fbdedf7a@daynix.com>
 <CACGkMEtGx7ajAmJUib++qJ2=rhZjyj5p=7iN2xBvba4gcBAQtg@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CACGkMEtGx7ajAmJUib++qJ2=rhZjyj5p=7iN2xBvba4gcBAQtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/03/24 13:02, Jason Wang wrote:
> On Fri, Mar 21, 2025 at 3:01 PM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> The previous description said:
>>> A driver sets \field{max_tx_vq} to inform a device how many transmit
>>> virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
>>
>> However, it also controls how many receive virtqueues a device MAY use.
>> Copy the description of the virtqueue_pairs field of struct
>> virtio_net_ctrl_mq_pairs_set, which also has the identical semantics, to
>> clarify that.
> 
> Thanks for doing this, I wonder if it's time to rename as "max_tx_vq"
> sounds like a TX only thing.

I'm no longer pursuing this change. Please see the discussion at:
https://lore.kernel.org/r/765a23aa-bb6b-4a01-89f1-31ad213b4715@daynix.com

Please also review a change for QEMU based on the discussion:
https://lore.kernel.org/qemu-devel/20250322-vq-v2-1-cee0aafe6404@daynix.com

> 
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   device-types/net/description.tex | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
>> index 76585b0..5178191 100644
>> --- a/device-types/net/description.tex
>> +++ b/device-types/net/description.tex
>> @@ -1578,7 +1578,9 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
>>
>>   Field \field{indirection_table} is an array of receive virtqueues ids.
>>
>> -A driver sets \field{max_tx_vq} to inform a device how many transmit virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
>> +Field \field{max_tx_vq} specifies the number of the transmit and receive queues
>> +to be used up to \field{max_virtqueue_pairs}; subsequently, transmitq1\ldots
>> +transmitqn and receiveq1\ldots receiveqn where n=\field{max_tx_vq} MAY be used.
>>
>>   Fields \field{hash_key_length} and \field{hash_key_data} define the key to be used in hash calculation.
>>
>>
>> ---
>> base-commit: b495841a8e80d12c1130f8868f4128866291142d
>> change-id: 20250321-tx-78e44c50a035
>>
>> Best regards,
>> --
>> Akihiko Odaki <akihiko.odaki@daynix.com>
>>
> 

