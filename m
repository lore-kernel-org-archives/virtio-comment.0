Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DD11C5F2C
	for <virtio-comment@lists.linux.dev>; Fri, 21 Mar 2025 09:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742549864; cv=none; b=SD4cb7LHHjmiQrIYU+M3bxr6NG2ou4lpZRQWhxAd0Q5umNAoOb67zTuHAsh7LyHtcwsud7OX1WAD3o3VaAi5haVJ32XRzBYdN6V3JldtDp8EzTTwNnbuYW/c6+mD3m99O1bDgzSfK+yoo/N374ZWdMNkG4IpcDoyWcwmb4CPM4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742549864; c=relaxed/simple;
	bh=YJaEgwmJIyFTZxP4ePgZHtDuI15+Lu7TA8h/nKmYzOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=emNPKBdPAFJ5nBBscB97Alm3CXbEhAC0yCDmZWtdjlxwNDc5Ho0i7ERfgIIRBfwbUE/JOlPeFj7WB7rs8alOUsAws3DnvvQyq7OT1qMZ9zCkNc19Tbm5kjhQ/lhiyTyDyWZd7MXFggI1I8Qj37leD1GyF+ZYNqX5Dypce+77wnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=gf4M923j; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="gf4M923j"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2235189adaeso32781905ad.0
        for <virtio-comment@lists.linux.dev>; Fri, 21 Mar 2025 02:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742549861; x=1743154661; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wh21qQYoaMdE/Pr+2Tk+Jd0iSLb3Du1+NiUmdesCAyw=;
        b=gf4M923jAWQgTnaPu4mMX81uqJWfb8mSTTo0sSsOm/GpvXOk6+82EO4RO2UkWDs06U
         3yzCa4m64bDR6Twe+gm9jnSRPxAKPnF1OaVOr0Q4i9wh/T+pOAyiPYf0FPTCx0++WfZX
         R2AskK1KLjTXAF0z2Nvdj5+LVDfoNLDq+sv1E4v75PGqEPaFg3SDz3JFCX0w1bEjvIRB
         zUyzwa6vxTo4j6uK5jpmpA995wF/12AIrXz7i6Zk6wUcuAis/e5gJ9StYRJWumJwbniD
         dUXFMWrXRu1hqAdpUrFOuQIH+PyWsfpBVY8rhtcRFJ1UpBfg7dHRsf325dBtlZJOlVTs
         owIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742549861; x=1743154661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wh21qQYoaMdE/Pr+2Tk+Jd0iSLb3Du1+NiUmdesCAyw=;
        b=cQZZbGgwF+euGYCadBB9x88wKsI4siFQ7prOr4iDL4bbSyIbXksSzxKLs8F9/JuVGv
         3HzsDjdvSBz1F7mud3wUym9BGKJgwqXkLb1LwXTauJM9ZYuD80pWynML02VaGynX4ZUN
         OejxRi2jXg9QiuBsxnd9Rl/qIPjWjHiJgtevRdy1Ljx30Jexv4SR3XFbrj6L7EW4komT
         2VhwCshUlsiZsBlFDLGOQAMeVwuDd+FRUd2NEmLibxerW/P0YoZeg6X1uU+eKewuZt0j
         BMv1zeuD+WB+Mjnfl0X/xl6tEUrAplIjrQDqqWgob9dwsgIqrB+bOtGhhXEXnejcG+DW
         bK0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXdhlD8lchapOGsG2g3o5dAxJfy36lksUw87mZuXqYYgORBXrJ6a3z23OFpUhl+I7MEjIAy7NKXXgzwRBHKqw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3q0CFZWezTziTHwLtE4AhT2tPmeo2hLTj0jaLt1YGmVv4BgdD
	TOmcFKOEWV8mOA7gIDSIVA6ryELQQOS+ElKxncwqzUhlSEV3ahpsmXmck5A78R4=
X-Gm-Gg: ASbGnctQQg6Faijx03i5pSbekx9If+PYJEOwrR3x/OOPu9k38CW58XtCGdGRK0kApav
	u5o/8sl43YH20c5ikxf42EOPKkIsJvwSu+h6/u62dPJcRcgbJXPYVa52yMlhGN/xSQPk4qlv8P4
	NAl68hlBsuRmFhGvHj6ecUY3Ut85/izsKqJHaHfPadc/tqNa4ZV2Wft3AsW0YFY0r9HXs1KZhRB
	o9q7jn+ccHdy01jj8iX+SlXat8f6G01vu/aAZfSy8yitcQ1YSTvaM3TXYYdgKbsxxrzJ5vEoEE9
	0JlY24XR8oSlc8Sf/5aF8epIEAJL1YhZA7P7wUmqzwpIujofv1bLuXNl9k1xbSWsO3dn
X-Google-Smtp-Source: AGHT+IEWTa6DmOxDiCKNYHEEvbzxKsUpdsQST9lsfDFRSyVjnuRP6oiDi9Ia78XRTSQ/gKFv4kHa2A==
X-Received: by 2002:a17:903:41c8:b0:21f:53a5:19e0 with SMTP id d9443c01a7336-2265e6bb8e7mr102194005ad.12.1742549861245;
        Fri, 21 Mar 2025 02:37:41 -0700 (PDT)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4588bsm12182945ad.58.2025.03.21.02.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 02:37:40 -0700 (PDT)
Message-ID: <765a23aa-bb6b-4a01-89f1-31ad213b4715@daynix.com>
Date: Fri, 21 Mar 2025 18:37:38 +0900
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio-net: Update the max_tx_vq description
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev,
 devel@daynix.com
References: <20250321-tx-v1-1-dd21fbdedf7a@daynix.com>
 <CAOEp5OdKAQw3cex-rfdF8ZRY+nnLumN0DbfZ702WdvyyXFAmNA@mail.gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CAOEp5OdKAQw3cex-rfdF8ZRY+nnLumN0DbfZ702WdvyyXFAmNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025/03/21 17:01, Yuri Benditovich wrote:
> On Fri, Mar 21, 2025 at 9:01 AM Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> The previous description said:
>>> A driver sets \field{max_tx_vq} to inform a device how many transmit
>>> virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
>>
>> However, it also controls how many receive virtqueues a device MAY use.
> 
> IMO, the meaning of this field is exactly as stated in the
> specification, i.e. the driver informs the device how many tx vqs it
> is going to use.
> Usage of rx vqs is defined in the indirection table and should not be
> somehow limited by this field.

That sounds reasonable. QEMU limits the number of rx vqs, but it is more 
natural to change the QEMU behavior instead of the spec.

Regards,
Akihiko Odaki

> 
>> Copy the description of the virtqueue_pairs field of struct
>> virtio_net_ctrl_mq_pairs_set, which also has the identical semantics, to
>> clarify that.
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

