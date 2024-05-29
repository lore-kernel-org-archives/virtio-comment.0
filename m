Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D2F167DB1
	for <virtio-comment@lists.linux.dev>; Wed, 29 May 2024 10:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716979352; cv=none; b=XZoifZjY3EG8SUhztvMwH4Hib5Fn8289iCZb4nq3IYoROS9KN5+qovRUUZF68DK2kcvaXIxBzY7bRysgsh1zXJOE0kAhBhD4tK+/KSGihvpphHApq1xgw3gTZIXckmMAgSuJigFkh9t1BppgTfoOFShIt0psstsXngIV4fvkjUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716979352; c=relaxed/simple;
	bh=3howPi0pQP9OaySuJOolDz8GWHV+qrXxanbZqUvz+HU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=XLikV2CJqOCQ5eWYoVazPztFFmVqqfnFv6ziuLTVUXzwuVoSZK4v7vd9IgMD/jpd6jMSDN4DfBALdQHCw5exAIMJx7Rw6r0+zlMm/fZPwEjRJnjnqyXxqm5jtcLGErGqWLxrlaNPawdwCWisE7bChXralUDiR/A4/uwk2VE28bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H2S3ovpU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H2S3ovpU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716979350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=myBJK7LDLyUAW+8IL4UkrFwPERZEn0hsuDcbAlqEtNw=;
	b=H2S3ovpUAxFIHrymZOqhk11mD1tpu1JagwbwADjyGPosGdhXeb73yl4nU5iLI9lAs1HuwS
	V+LvXKL2tvwG+NcUmqvab3Dvyvf2dz38lQQw0N2qXabl5UzCl0MiB2v968d7wmt9ajC//c
	ANDamwFHKnxttaAHxkq0MqcgSPnRzck=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-HIUrmzrSM82jhGmw2UVXAw-1; Wed, 29 May 2024 06:42:29 -0400
X-MC-Unique: HIUrmzrSM82jhGmw2UVXAw-1
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-df771bdded1so3066477276.3
        for <virtio-comment@lists.linux.dev>; Wed, 29 May 2024 03:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716979348; x=1717584148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=myBJK7LDLyUAW+8IL4UkrFwPERZEn0hsuDcbAlqEtNw=;
        b=MydZilJmjWiuSGfpkcI9A9GV+dr2J0+3We5ZYWdalzEbzfKubnSY5q19gZA0UYkasy
         kBD/06zUOun9TJoQjotnQ74utImzE6n7HaZhAmEuI92z/FUc9rVHVAQAq9sQkYWRrK85
         MtiN4WWAXw91hPClKWQDXv5aJ4cOQnU9B5KEkrNkdqFV2fIplZiZyYZL/GWNbYZimHtg
         5PnnVoMBrHP9SwG9QM5+sshspUdYTJzURn0z0+ceUYYhxesbQwJGF8N1C05U0epFuoig
         EPA9b1Si0663sUPIYfpb8RJZwBdCzKoWeLDskCOcXrZ8/Wru5SMxrjKleFHTvEk5LXB1
         rCaA==
X-Gm-Message-State: AOJu0YztMsrTUo/3ukLx7yScx/H3usQOSoDDKPHT3QHdntSuNctZKmsk
	YAQxrqUfXJLjTGdU+NXDu/UoYss7CJk9TcMv1JPgrn+z4hvEu83qapgiOop7FG9HpUy11pwZYJ2
	x6ZiAxB1Mkc7xucPJ3dKacpKWOpgcdn48+LYgOVTmBxy5OsKRhvvZHW+KJJSP/zbX
X-Received: by 2002:a5b:d0d:0:b0:deb:4031:2a5e with SMTP id 3f1490d57ef6-df77218b187mr18038002276.17.1716979348184;
        Wed, 29 May 2024 03:42:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnsI3F8Lbq72K4fqINM4XurIPd/C1pnWIYmJ2G8mOgjf8fjqJG6x/JNMC5oZ4wpMRlFyieBA==
X-Received: by 2002:a5b:d0d:0:b0:deb:4031:2a5e with SMTP id 3f1490d57ef6-df77218b187mr18037970276.17.1716979347740;
        Wed, 29 May 2024 03:42:27 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-109.retail.telecomitalia.it. [79.53.30.109])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ad92f558adsm14649996d6.21.2024.05.29.03.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 03:42:27 -0700 (PDT)
Date: Wed, 29 May 2024 12:42:21 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: virtio-comment@lists.linux.dev, 
	Vincent Guittot <vincent.guittot@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, 
	stratos-dev@op-lists.linaro.org, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
	Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V3 Resend] virtio-transport: Clarify requirements
Message-ID: <kl3cehxu74h2c7opytdditx6bodpy7clbofivnkr5druswlknz@o2nsukuuipym>
References: <3543c631e29d35a667ca9d9e912d1a6db1feb0ce.1716197180.git.viresh.kumar@linaro.org>
 <a752usapxpmlwpm5ywvccrrkmumi5aosbzvsxjghsotn4kmgyq@hlmjdhedeqbz>
 <20240521101023.ooesha4uo3fufr3t@vireshk-i7>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240521101023.ooesha4uo3fufr3t@vireshk-i7>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, May 21, 2024 at 03:40:23PM GMT, Viresh Kumar wrote:
>Dropped virtio-dev list.
>
>On 20-05-24, 12:20, Stefano Garzarella wrote:
>> I haven't followed v1 and v2, so apologies in advance if my comments have
>> already been discussed.
>
>No issues.
>
>> On Mon, May 20, 2024 at 02:59:40PM GMT, Viresh Kumar wrote:
>> > +\transportnormative{\subsection}{Virtio Transport Requirements}{Virtio Transport Options / Virtio Transport Requirements}
>> > +The transport MUST provide a mechanism for the driver to discover the
>> > +device.
>>
>> This seems a little too stringent. For example, does MMIO offer a discovery
>> mechanism? IIRC we have to pass the address via device tree or kernel
>> command line.
>
>Right. Is converting this to SHOULD okay or do you suggest some other
>change ?

Or MAY ?

>
>> > +The transport MUST provide a mechanism to implement config space
>>
>> "configuration space"
>
>Sure.
>
>> > between
>> > +the device and the driver.
>> > +
>> > +\devicenormative{\subsection}{Virtio Transport Requirements}{Virtio Transport Options / Virtio Transport Requirements}
>> > +
>> > +The device MUST keep any data associated with a device-initiated
>> > +transaction accessible to the driver until the driver acknowledges the
>> > +transaction to be complete.
>> > +
>> > +The device MUST NOT access the contents of a virtqueue before the
>> > +driver notifies, in a transport defined way, the device that the
>> > +virtqueue is ready to be accessed.
>> > +
>> > +The device MUST NOT access or modify buffers on a virtqueue after it has
>> > +notified the driver about their availability.
>> > +
>> > +The device MUST reset the virtqueues if requested by the driver, in a
>>
>> Should we also talk about the possibility of resetting the entire device?
>
>Do we support that today ? Maybe we can if the maintainers agree.

mmm, I had interpreted this statement as if we could:

   The transport MAY provide a mechanism for the driver to initiate a
   reset of the virtqueues and device.

IIUC device reset is always supported (see `\section{Device Reset}` in 
content.txt) and it's transport specific. While single virtqueue reset 
depends on VIRTIO_F_RING_RESET.

Thanks,
Stefano

