Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCB53BBC0
	for <virtio-comment@lists.linux.dev>; Thu, 20 Jun 2024 06:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718866198; cv=none; b=o01yt0FKBOAdqbTWSpNJH5SKgYXq1gTIrQmJjPD3CWyTMOSmFadTfEDYEhMWTrd3EQkpOEwQZQ+0G365fO6ukP/INCehDt6oSkfGgSrTzJzIT1tT3X8Rr7gXQyjvw2HiLn5q627dqTegVA70S5/MmUBBa1Fla1maYwpjfpGioww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718866198; c=relaxed/simple;
	bh=opQUbQ3oIAKCxbSIPBDczYeac30frqQggEs5M5djask=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=CqO5i4OD359j6EhXM2jnnSVz+qtNO/ag2aLS3vrxqoBgzZIfFntrtus3OkWDgeqmq0mUDlDocxvibHz5MUTTbrB+feVKjGgCTy2tnJuWs1UA7sda4jDHJFL36oZPkNvpYDyF61zTXvXl29PQYa0Cf3fr0WcLRIjjMOfaheaWjlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dtOD4w57; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dtOD4w57"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718866195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ghjgC8xJ3pZ1ClErboNyKm7UWJQE6ZQ+/DuprHOrfHc=;
	b=dtOD4w57BQuAyw0lo0rEoxTUcGHcOeXu1KNBGFr7+1j1h1YyljASm4t99WfKrA6IQlUBTz
	H3OgPOHTnp/S257hJrs5qkKNMrAuDkv3imZCiUNbOhEQfYz10/bHzC1yNG3w8JZuyOaFzu
	K+zmcUTesk7vdal7T+BfbaYnnKT+wSg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-RJO12MgYP2q39qrsYPeM-A-1; Thu, 20 Jun 2024 02:49:54 -0400
X-MC-Unique: RJO12MgYP2q39qrsYPeM-A-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-57d0fffcb0dso200932a12.0
        for <virtio-comment@lists.linux.dev>; Wed, 19 Jun 2024 23:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718866192; x=1719470992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghjgC8xJ3pZ1ClErboNyKm7UWJQE6ZQ+/DuprHOrfHc=;
        b=PPs2ls/Mwah4wjbVKWdkHwv+z721+gRtmfUaRM2ZW3IqAEzDBHs/SMVnbYGuz+xLFg
         45EklepEAto94EL/sNvMfzp1jz38J9JCfvMx2coizYINvqBeyjvCccrr9cIBa8mvyiM5
         FVX9q6pJzysY/jytjjj5zaZilXvI8XvfH6EHJ0g9Ivws0Ij0xRZYZY6FrXpxueE/Y7h8
         KbBc1avusi2dbv4xxe+C31mZVfKiAmrD0Z+BEneSM+nSwyLPAc9VFNfYy1jT6tH9BM44
         kICbE4LVQ5HISSzf3vksEFd+7BDIhMkbpgCWU+LZSoLLicLq8mAFwCxmC6LVa6Y/Y5y8
         B4qg==
X-Forwarded-Encrypted: i=1; AJvYcCXQoJMxvjIRjxIDxcZfm/LrMkuIspSUpWUwPr9UjCEnwQOJRjAHYDxxPWFlXchhMeOT4uC+Efc8MTTwuV9VNCeATHLCEDZ4cp0FzpW5Sic=
X-Gm-Message-State: AOJu0Yz5Kt0XSqvDuo7XxMio9DdpdrENYw6q4IckVReozcOm2rYods7G
	ZnsKE9OJszP2BjGTvQaGaYULLZKjobsEWEDedcQYndyTo+MIy7c8Rhvq6hqlLmh1zFg/8kBRyuO
	dWmgexvU4jJf3zJOe8UU7EeIl1FUhxuL/eu2cce2ZQoAtekiNKh2JdHPDvbEyUrz/L970xdFvvr
	8=
X-Received: by 2002:a50:c2ca:0:b0:57c:672b:ca34 with SMTP id 4fb4d7f45d1cf-57d07eab99cmr2209262a12.28.1718866191873;
        Wed, 19 Jun 2024 23:49:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHf3TBqAH/6+ylrcboho+eoQK0O/an7EGMp3uWHhHUkkZ47maCivSTd4TbrYyf1CL8oX9R9Gw==
X-Received: by 2002:a50:c2ca:0:b0:57c:672b:ca34 with SMTP id 4fb4d7f45d1cf-57d07eab99cmr2209245a12.28.1718866191265;
        Wed, 19 Jun 2024 23:49:51 -0700 (PDT)
Received: from redhat.com ([2.52.146.100])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb741e911sm9322704a12.78.2024.06.19.23.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 23:49:50 -0700 (PDT)
Date: Thu, 20 Jun 2024 02:49:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Vamsi Krishna Attunuru <vattunuru@marvell.com>,
	"lege.wang@jaguarmicro.com" <lege.wang@jaguarmicro.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>
Subject: Re: [virtio-comment] [RFC PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE:
 add new used buffer notification suppression mechanism
Message-ID: <20240620024922-mutt-send-email-mst@kernel.org>
References: <MW4PR18MB52448CB41784611E654333B3A6CF2@MW4PR18MB5244.namprd18.prod.outlook.com>
 <PH0PR12MB54810AA98716C6398A412342DCCF2@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54810AA98716C6398A412342DCCF2@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2024 at 06:08:28PM +0000, Parav Pandit wrote:
> 
> > From: Vamsi Krishna Attunuru <vattunuru@marvell.com>
> > Sent: Wednesday, June 19, 2024 8:49 PM
> > 
> > Hi Lege.wang
> > 
> > Thank you for proposing this new feature. This capability is very much useful
> > with PCI transport on newer hardwares.
> > 
> > May I know the current status of this proposal, is V1 already planned and
> > prepared for the review.?, I would like to collaborate on refining the proposal
> > and the required changes in the spec.
> > 
> > Regards
> > Vamsi
> > 
> > 
> > 
> Removed old dead mailing list.
> Added the recent mailing list.

Yes - pls subscribe and repost to the new list. Most people saw nothing.
Thanks!

-- 
MST

