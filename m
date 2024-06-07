Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DAC45008
	for <virtio-comment@lists.linux.dev>; Fri,  7 Jun 2024 06:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717741936; cv=none; b=W+n0e+1W1XxT8SyFz8VX71AHM5drw7R7Ix+vo9FnlI3ai0wSuvs4Dkm0H/qr+TlDRZU6kcwbW0TJXFOgMT0X/BOKYyMzL/Md8v/BqfMAtxK5xpv9rUf4R9ohpocG1ZcTwBCtVq5+kriIbh2sDiJiOVjTbGXGwt/vpK2aMgdtQHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717741936; c=relaxed/simple;
	bh=q27GXNLp+qXvQgoKk9jHRwiXnf23seqn3ZrSipJv97E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=psGqEU4ABst+czo4YwmyW9L7MxFqffqZ/EMJaDAMW+tl1bGGSayaQyq58xpxUh/8JBIF3ZEYR6x9rG4/uhDEL5/+mzm9X0pek78vxbR1nUwYAUYGwlqMbZnCDIAjrR1lL0XymKbuI9ETdqmWA4tCtE1+RCgEyhG/5qGdyR59l74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=exIsDKG8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="exIsDKG8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717741933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q/Xj9S7gIHsiyZqxjUS4UYAX8WK65N8qnsWn6+v/+Tc=;
	b=exIsDKG8dnEDLE3tzy299JtrEYyXOCtuHH8zR3/+e8R0wEuqDqnT2Dv6WkIQ1zFPwmf71x
	5t73dm9fG06F65/vCPnb4yIzAlAY6U57tHFcxJcqEa3HEJSxJP1lJsl9ERy38tWnHtJqUf
	Qs0qJ7RvIoDj+6PHjpN7V2gXNdmqxs0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-X65uh6yxPiK-1rtS9Zpa_g-1; Fri, 07 Jun 2024 02:32:12 -0400
X-MC-Unique: X65uh6yxPiK-1rtS9Zpa_g-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a6b7bd3e92eso242625566b.1
        for <virtio-comment@lists.linux.dev>; Thu, 06 Jun 2024 23:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717741931; x=1718346731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/Xj9S7gIHsiyZqxjUS4UYAX8WK65N8qnsWn6+v/+Tc=;
        b=MQyfkaZRT4Do6afm9zoy1HQDTjDkjXeeJQ3AV6YLmucd3F7DW/IUHYQ2TV6AqA1owA
         9CQXB2Y6bkaGemtppuNuuiN1UFDaTjepHd4GFrHzDQkzlYVylaeA1qj15NM8o6IVKrY5
         PeWVFrZRTT0o1tAYcArXmQSgNlriBLXDYjhzqC1ozgQ4J5u+PnkBwuZJcP1ZnuKZDAFa
         7gOfBNkwiYYFmOBRFn83wuMwcgkdRjhHwqKjjoU1MDe5YNnVtBVchThQk9kaOTzRdwMi
         RKApYStEzGliuaKv2BkQ5oW+s4BFlei/GP4ueIOE6e2h/SFglrLLpJcCN0tX7euNU0rI
         z9cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpOYe3gWiaF4JZOv8Eh4+fDUOkE3J2oMH1ytpCgkaNLzJ3qxoqeK/w3+v9YL8sQO0VqGG2qYTPSYIvBahvJOc4NjotZruqXmW7Nln1nOE=
X-Gm-Message-State: AOJu0Yy/q8K18NMqAXW6ZUMb7rBzc6WweS0h1uMW9k9LEjirRysQQSFY
	WuG1xAOX6N1bdXLclPRRQEr83Y/VKBLoms3QtKe4L0NHFBIvv/k6PEev/DJCbvU8sKS8Z0Wuz+Q
	wcLzSbn+Lf5cUAQA4OScy6gSbUGxAmoFhtsSaupcbCcSEoLko2C5pY8KF7GJX4L2B
X-Received: by 2002:a17:906:7fce:b0:a59:be21:3587 with SMTP id a640c23a62f3a-a6cb934fe01mr156494566b.8.1717741930837;
        Thu, 06 Jun 2024 23:32:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ8PBgFMJ3RYeqXENz0nTO2lGujoS/z11O+ArZxYXkuh0eOkhLv2yYVfOsBEUxCziVIBBn8g==
X-Received: by 2002:a17:906:7fce:b0:a59:be21:3587 with SMTP id a640c23a62f3a-a6cb934fe01mr156493166b.8.1717741930350;
        Thu, 06 Jun 2024 23:32:10 -0700 (PDT)
Received: from redhat.com ([2.55.8.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c8072a46asm198466266b.206.2024.06.06.23.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 23:32:02 -0700 (PDT)
Date: Fri, 7 Jun 2024 02:31:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: ballot system back on
Message-ID: <20240607022455-mutt-send-email-mst@kernel.org>
References: <20240606082035-mutt-send-email-mst@kernel.org>
 <87ed9akoab.fsf@redhat.com>
 <20240606145829-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481B75009073F188A5716A8DCFB2@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481B75009073F188A5716A8DCFB2@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 07, 2024 at 03:43:30AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, June 7, 2024 1:26 AM
> > 
> > On Thu, Jun 06, 2024 at 06:51:24PM +0200, Cornelia Huck wrote:
> > > On Thu, Jun 06 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > >
> > > > So, things seem to be working, even if they are now a bit harder to
> > > > set up.
> > > > Let's start wrapping up 1.3?
> > > > I think we need to pack up and then do a ballot to ask OASIS to get
> > > > a special majority vote for us.
> > > >
> > > > Right? Cornelia, want to start that?
> > >
> > > I've now created a ballot to request a special majority vote; please
> > > double-check whether I got the incantations right.
> > >
> > > And because all that work is not really visible: Thank you for getting
> > > those ballot scripts working with the new platform! This looks really
> > > painful and time consuming...
> > 
> > Yes it was!
> > But in two months we did not get API access so reverse engineering it is.
> > What made it hard was that the new system does so much in javascript. Both
> > the login system (it's a single site why does it need
> > SAML?) and the ballot form itself (lots of asychronous stuff, animations, even
> > a simple checkbox is hidden and implemented from scratch in javascript
> > because reasons). So I could not just use selenium APIs (wasted a ton of time
> > trying to figure out why). I started trying to emulate keypresses and mouse
> > clicks but that proved too hard to get right. In the end I hit on the approach
> > of injecting javascript into page to interact with the hidden form elements.
> > Thanks,
> > 
> Thanks a lot Michael for the heavy lifting to get this operational.
> At least I didn't realize why the voting system needs such additional work specially when its upgraded.
> Is it for the github integration?

Exactly.

-- 
MST

