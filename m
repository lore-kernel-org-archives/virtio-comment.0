Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74881E4A9
	for <virtio-comment@lists.linux.dev>; Mon, 24 Jun 2024 13:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719236659; cv=none; b=g7Swd2S9AisTR/z1AEU7UOTQUrfv3Fw2wr7UCD/kBgT/tn0jepH0H0ndYoPhq0geP3EQscKTqQ55RukWCdoXb8WDaq5wFLc/Hy4+hQ+1ykCyABKvfISQWavXWE0o64qrLaHlAkFwKlAoxiBrChZylSw8ymZpx1QJVN/qEEMOF7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719236659; c=relaxed/simple;
	bh=KcnS72LdflI1Xmk70/NFfN71tY0UNW8mzylUJUoM0ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TnKzX8wgzytJAZBymi0wGn1meA60X6vr9BtZGUZim0pnILtELltY8J5GFgDC+Ku2cS5+Z7dJLsSkFYA5q+xdRYixrGj5iT85scu8z/ly17wEjCASJXDELy8Fpzmnm3RbTViSDYK56qZq0oNlDdKiHNNEvB7igI0Izyw4ch0Gxbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ktpf+KoY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ktpf+KoY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719236656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uQXHdsXTbIKjtkUBeR23TxQhbY8KV31LTP0PorzVb8A=;
	b=Ktpf+KoYqbywHaMRErK+RJAXs6fEFA/WfVzeQcGV44lRma/xx/eUfwow8CoHG2C+YvQinL
	H4/atsMlRWTDdAL66BOfYcLzRZlt0WpwW8hFPjLArHKTrV8c1v2qmdFe5Wm4q1vD5wjLcX
	p49h/zvs1X5aI+dI76vWTEHW51eJigM=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-HYxxGz-7OF27-TbMNq4ZhQ-1; Mon, 24 Jun 2024 09:44:15 -0400
X-MC-Unique: HYxxGz-7OF27-TbMNq4ZhQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52cd67973e0so2491883e87.0
        for <virtio-comment@lists.linux.dev>; Mon, 24 Jun 2024 06:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719236653; x=1719841453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQXHdsXTbIKjtkUBeR23TxQhbY8KV31LTP0PorzVb8A=;
        b=oIYBMfOjWOGYd9YEfwclg8OKtsCXlK4zOATnk2dkpa+tjjmaC5u7ycq04iUScVyAfd
         G7KDPpnZYJKo3EhvXYfqWWGk+o1idevHCXrZd76QTdke9k8yis2pg3tvOeOND1mRmtZ8
         DrbIrhmpaUquEVQ3KHWjhYPtp17Ra10A/XR9mYirdGY4dt4D6F0aRtpAT1t/Ftrmh/au
         anwzjaZ2/2ZqhrpA4MUJHfRSL1hKG1WStzdP4J+dcQlcXoYUAESw8G89AKcH7uNJ5Swa
         7DpzUU2MOBx7u45pnIhxQthqdVWpuahQAhv+Eq6DH7sKI95HVFZ72g7YoojeO+uEa7I8
         jfzg==
X-Gm-Message-State: AOJu0YwNypiHG59sCYw2fh6bMoNbcTnJvKm0scOKMcq+HKjTqG3pybUN
	plK4/Mq1RYTpzI7JoFhJH3Ov5jM0fLrrsSY9Z/dEyh4I4ysNK7pH7kvbtkIxEqSH1RJv+TJdCWG
	9pYnUMXCHY/MpvvzsXVFaL4rbmqyTR4cUx8wOvfd0Xof6DrR4dgxBZ9q5bMqVO3Afc7/SKJvy
X-Received: by 2002:a19:ca05:0:b0:52c:ddef:4eb7 with SMTP id 2adb3069b0e04-52ce1832a08mr2984238e87.20.1719236653030;
        Mon, 24 Jun 2024 06:44:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGf5eOHDCU7qsIvH4ODwxEc1SzeaZaTlB1NTgLSoe2QchtO0kGk1OkEaEnkuzffPE5kz0zpDQ==
X-Received: by 2002:a19:ca05:0:b0:52c:ddef:4eb7 with SMTP id 2adb3069b0e04-52ce1832a08mr2984214e87.20.1719236652353;
        Mon, 24 Jun 2024 06:44:12 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.216.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf56ea09sm408573366b.201.2024.06.24.06.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 06:44:11 -0700 (PDT)
Date: Mon, 24 Jun 2024 15:44:06 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, harald.mommer@opensynergy.com
Subject: Re: [PATCH] virtio-can: define out of rage can-id
Message-ID: <7qpbbtnwmxgmezkihj3f3e2fgbd5nvmh2cjphokumar7glznqw@7qsmcp4bgiof>
References: <ZkyrnsCXu8mQpDQI@fedora>
 <pf656j5da3lxgo2nn6nvhyz7tutf2rktbwxzddyhenyyvhzxpx@is6fo76auxms>
 <ZnWN3ePT6G6nL3N9@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZnWN3ePT6G6nL3N9@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Fri, Jun 21, 2024 at 04:27:41PM GMT, Matias Ezequiel Vara Larsen wrote:
>On Wed, Jun 05, 2024 at 10:42:19AM +0200, Stefano Garzarella wrote:
>> On Tue, May 21, 2024 at 04:11:42PM GMT, Matias Ezequiel Vara Larsen wrote:
>> > Explain when a message is out of range.
>> >
>> > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>> > ---
>> > * This patch applies on top of virtio-1.4, which has not been released
>> >  yet.
>> > ---
>> > device-types/can/description.tex | 3 +++
>> > 1 file changed, 3 insertions(+)
>> >
>> > diff --git a/device-types/can/description.tex b/device-types/can/description.tex
>> > index 2511d9c..98b163b 100644
>> > --- a/device-types/can/description.tex
>> > +++ b/device-types/can/description.tex
>> > @@ -191,6 +191,9 @@ \subsubsection{Controller Mode}\label{sec:Device Types / CAN Device / Device Ope
>> > invalid state with VIRTIO_CAN_RESULT_NOT_OK in \field{result} and MUST
>> > NOT schedule the message for transmission.
>> >
>> > +Note that a message is out of range when a standard frame uses more than 11
>> > +bits of \field{can_id} or when an extended frame uses more than 29 bits.
>> > +
>>
>> It's not clear to me where we refer to an out-of-range message before. I
>> only found "\field{can_id} or \field{sdu} length are out of range" where
>> IIUC we talk about the length of certain fields is out of range. Are we
>> talking about the same thing?
>>
>> If so, I think we should talk explicitly about the "length of the fields".
>
>Yes, I will rephrase it by using the "length of the fields" wording.
>
>> Also should we cover `sdu` as well?
>>
>
>I think we should cover it but I am not sure when the `sdu` length is
>out of range. In the reception section (5.20.5.3), the spec states:
>
>`If the feature VIRTIO_CAN_F_CAN_FD has been negotiated the maximal
>possible sdu length is 64, if the feature has not been negotiated the
>maximal possible sdu length is 8.  The actual length of the sdu is
>determined by the length.`
>
>For transmission, I guess `sdu` lenght is out of range if the length
>does not fulfill the requirement above but I am not sure.

mmm, I'm not sure too, indeed that is only defined for "CAN Message 
Reception". Maybe we need someone more inside CAN or check the CAN 
specifications.

Thanks,
Stefano

