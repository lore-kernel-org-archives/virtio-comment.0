Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64916171070
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 08:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718095022; cv=none; b=ma5B+i60DLbA7WZVFKybiIBAXBg+WRdo5Dhdppveu9hY7I1P3gNTWHvR/2p5wx51N/27SX2FUW4155445njljTkw1dD4MzoXiV9oyRlB7EJs/GpThEHpTR1yO6rF57P4TJi3CQaZOsr/VCExsPpCJrph/czjez0tRVhWyU+IPYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718095022; c=relaxed/simple;
	bh=GWRJYQNvMtd9EOIu+6pJdc+2KduFKoOj1mnuiybJEmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UcOrMz8e/48Oe5r7yzbfekfDHbhG6nHWnGChOkbs72FYAPVoxxnnbCX5qmimc49QcRWsER+SKNX9zie01LLm9zL5ZwV3Nn+6phZjZemuZ6yS641UB1MAtSWO3S9UoPuYPoOM+p4ypc0OnZFUM4/vVU3bLY0Lq3JbO3k1PzfaKFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZzaJAn7T; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZzaJAn7T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718095017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GWRJYQNvMtd9EOIu+6pJdc+2KduFKoOj1mnuiybJEmo=;
	b=ZzaJAn7TkFv1v1HhvoUfNxdvrn/0g+A7whmdXZExR8jHy6wB8KnPfQPPrF5OQsCpJOWB6v
	lun/I01hRAmpds9lvyidw/ODluKYuzKrtyOMOUXIy0iFY6AGmDP1+QHlR37GivvshV1nPT
	EX1dRCpVaHcS3YJ9IlDpuKYC5IjSdoU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-F40r0py4NtK8LrKuS_iYnw-1; Tue, 11 Jun 2024 04:36:54 -0400
X-MC-Unique: F40r0py4NtK8LrKuS_iYnw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-35f142464b9so1539294f8f.0
        for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 01:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718095014; x=1718699814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWRJYQNvMtd9EOIu+6pJdc+2KduFKoOj1mnuiybJEmo=;
        b=QoWOzkRs/4JYTX/IAO6lj+I5MvqkMg99d7m8oyCCY5IM2ek6g71RpyVrcWwOow/RO+
         HVK5tRNMHVyHoGcFLNBjUUmRDiuEFbiOISbkBao5ygxiACbfxNgDp0CBj4zDpV1oEbka
         Wcu9ps+TKp+20ou5LI9G7NdLAWMd7hp6AeaymZi/f+YkgPfmwVB9Ds1+Kz0C6zWUH0ix
         3LWMWYWf681M6rkUZB5Fs+HzDjxzTjEoLSmPDjfdfUUFURgHUSM2Dmx2rc4fCyzFVDIV
         NSSGQ8ZQXSBpbWaLluCrjjVo/LvAGBC7rdezLQdgZW7a0W3zffCH2267qmtuwMY5OiQ3
         IRKg==
X-Forwarded-Encrypted: i=1; AJvYcCXRA8komG6lS0Z8pTgH0NSJ6BpOfR/ruBoTv6mzv6xbR850LfERt6h34EyFIUMeLp1rIdUoYZWXtn19ovLgjwxnUIX6MaeCkBwFF1+krsc=
X-Gm-Message-State: AOJu0YzoZUNQszfSf23QyUZtH57WnYDjZsRGAD2wfMNOd90sZuE/g6Nc
	TOoorSwFGelYsUX7e3MP3BZwYSWQJQp4/sOlHgsin4MLQ4Z0S7NbDgiuj4U2WRzc3ZMIFFBrHBj
	JBAemLEahASduZXzkeVA7CRv8Dkv9ySgYS2g2wNaHO28lAP07f74wWqAB853n6tVq
X-Received: by 2002:a05:6000:1565:b0:35f:2366:12c5 with SMTP id ffacd0b85a97d-35f236617e2mr5109183f8f.23.1718095013922;
        Tue, 11 Jun 2024 01:36:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4Gr8gVS1sV9Qt6VNuIAZjX3LIjXUODoVSWf1gys4AxGoGcXHq7y2jlw26FPaU82tXE4vQ/A==
X-Received: by 2002:a05:6000:1565:b0:35f:2366:12c5 with SMTP id ffacd0b85a97d-35f236617e2mr5109160f8f.23.1718095013576;
        Tue, 11 Jun 2024 01:36:53 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.202.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f1cbf4664sm7113727f8f.46.2024.06.11.01.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 01:36:53 -0700 (PDT)
Date: Tue, 11 Jun 2024 10:36:47 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: Harald Mommer <harald.mommer@opensynergy.com>, 
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH] virtio-can: rephrase notification mechanism
Message-ID: <ibghaokieygbzjjhufda7d7dufpoz2vv3weapybu6yavllcinr@6n2s57dmrofy>
References: <Zkyr3eaCOctSn7BD@fedora>
 <7wfenngxylsnl73xnspd7r7icc5upuopxcr353tddxpiqlcp2o@4juhjr3m4m3v>
 <2e87edd1-897f-4969-a479-3b1b59529ec1@opensynergy.com>
 <ZmGD4CufscIixGTo@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZmGD4CufscIixGTo@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Thu, Jun 06, 2024 at 11:39:44AM GMT, Matias Ezequiel Vara Larsen wrote:
>On Wed, Jun 05, 2024 at 07:55:05PM +0200, Harald Mommer wrote:
>> Hello,
>>
>> exactly this is my problem here also. For me this change looks like saying
>> exactly the same thing just in different (not better) words.
>>
>> Thinking still about the replacement "from the driver" => "by the driver".
>> Was the original "from the driver" correct? My native language is German and
>> of course it can be that I made a grammar mistake applying German grammar to
>> an English text. Absolutely unclear to me.
>>
>> But if it's not that I have as a non-native speaker of English in the moment
>> no idea where the improvement is.
>>
>> Regards
>> Harald
>>
>> On 05.06.24 10:46, Stefano Garzarella wrote:
>> > On Tue, May 21, 2024 at 04:12:45PM GMT, Matias Ezequiel Vara Larsen
>> > wrote:
>> > > Rephrase the notification mechanism.
>> >
>> > I'd suggest to explain here what are we clarifying with the rephrase.
>> > Sorry, I'm not a CAN expert, so I don't understand the difference
>> > between the two versions.
>> >
>
>Thanks both for the review. The only sentence that I wanted to change
>is:
>
>"As the configuration \field{status} change is caused by a request from
>the driver the device is allowed to omit the configuration change
>notification here."
>
>I though it could be rewritten in a more direct way like:
>
>"The device may omit the configuration change notification as the
>configuration \field{status} change is requested by the driver. "
>
>But I don't know if that clarifies anything. If not, we can drop this
>patch.

Yeah, I think is more clear but I suggest to explain it in the commit
description as well.

Thanks,
Stefano

