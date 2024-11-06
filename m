Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA08198E7B
	for <virtio-comment@lists.linux.dev>; Wed,  6 Nov 2024 07:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730878850; cv=none; b=HrAV6QhJuZ5K2/0OV4Q3VWlSfaMvwfvBIFhJiYBP6/Cndz5RPac1mH2s6ieHImH7Jr+u9QDRhNZn2un6VxjYRStF+wQcnBY3L+Zjnyo5ufQUC8E2Uo+sG5bQr+jUo+Z08KkSdyERNfYkl/u0BQuAXQzlzG2X60mbG3HsR33v8NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730878850; c=relaxed/simple;
	bh=x4+17/8vHrcEnTsErEAHeKBdEINhWqfDRQQIi2Sbd1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=puZ2a2PCrTfzjg5pdZVmcGHc7oKw4RJe77fmh4F3i56AdfP5vel0v2X3s+25WHlzstxaSW0YyY+x92HAjQ/M3o/Be05xYASKyj4yHuAU6DWU6q/IHCZqjwB3IjGsxVMKJGAYt984b9zcJxV269rRrnH0nWf87OnVY9HSNqTRelo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y0wlCStA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y0wlCStA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730878847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tZnOoLA6103RPjDhwpdQpF3Oi4KZzZwa8CZogB4S0/M=;
	b=Y0wlCStADpLJhF4z2Ucv4i+xbvgiBOcl6gAkolE2QUv16cTu66nyJbDsV5WA20sdjHHjXQ
	TC0zoiQ1579pgprbu+o7zG/xg9ZMDSIu3UntuPQ2L98akckdsSY7MTnAOxMYbc+M3e5nnw
	qRMtU5eKjI/09fRICmwB+1iMmmm1VUk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53--c1HYNp1Oqq574uG6o8T3g-1; Wed, 06 Nov 2024 02:40:46 -0500
X-MC-Unique: -c1HYNp1Oqq574uG6o8T3g-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4315afcae6cso3223925e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 05 Nov 2024 23:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730878845; x=1731483645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZnOoLA6103RPjDhwpdQpF3Oi4KZzZwa8CZogB4S0/M=;
        b=XlfN3EchnITf3+wHg9zExiDxc+3xgty/TDFaB7mElqJSDM/T1ERuXKhzNjvkVyF2Bf
         TAema3+BuKfGUMBf7ZrwWrDB8UifTzIa0Cn4HoTPWc0t0OhTZAULkE9zuxuc07dybezk
         gqPWcWOzTa6PLCdTnL4QJD7BaW2+kjRyTG6MmyTqO4/YADESTSP9nce+E0ROZK+2fVmH
         2ouwlITzHr7muBw+wYnWe57u+kLxdo7WRjsY27h52h226r1arzJzNXUjE/S46CFAfPBJ
         LhB/zh7Ju5X2rle+3YyVhN+GlpIGpCtNqRjJ9CN3BzvSLYtIxumUcp3DIOhjvD01m6HT
         DAow==
X-Forwarded-Encrypted: i=1; AJvYcCW7gAjPwCreIc5koryIfx4I4KSJYMa1wQUWc8JO+xv3+9S3fBjYhmRDcpHlVYaj2WmdFnKOejasy9WArF08cQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVUDfvfiygFZIG3vgGDKfi4gsbiwMGO51aXVK2AWQT5jvvjuTf
	5ZsYBU6yuNeJAj+8J/XAqLhHhNtJuN5JQo2FVwaNITFwCnacWwuibIv044YLXoMZce2w0yfx7pw
	oUKENH9VVI3jr3+qG/7zvd8os9gBPNRNvnt7evhSdET5bBEcfq7MhkU5hAjll/+lS
X-Received: by 2002:a05:600c:19ca:b0:431:4a82:97f2 with SMTP id 5b1f17b1804b1-432a9a84e1bmr12077125e9.6.1730878845609;
        Tue, 05 Nov 2024 23:40:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYTRycIcM0JVqdznUx59A2oVZRP36yb63oYGUAyTlMymjUceFbxpOFXX7zLO9bcoTadi8LqQ==
X-Received: by 2002:a05:600c:19ca:b0:431:4a82:97f2 with SMTP id 5b1f17b1804b1-432a9a84e1bmr12077015e9.6.1730878845293;
        Tue, 05 Nov 2024 23:40:45 -0800 (PST)
Received: from redhat.com ([2a02:14f:178:e74:5fcf:8a69:659d:f2b2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432aa5b5e3dsm12333665e9.9.2024.11.05.23.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 23:40:44 -0800 (PST)
Date: Wed, 6 Nov 2024 02:40:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vamsi Krishna Attunuru <vattunuru@marvell.com>
Cc: Lege Wang <lege.wang@jaguarmicro.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>,
	"parav@nvidia.com" <parav@nvidia.com>,
	Leo Liu <leo.liu@jaguarmicro.com>,
	Angus Chen <angus.chen@jaguarmicro.com>
Subject: Re: [EXTERNAL] Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new
 used buffer notification suppression mechanism
Message-ID: <20241106023956-mutt-send-email-mst@kernel.org>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <SI2PR06MB5385346C86CF45806EC6E9F6FFDF2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <20240705035755-mutt-send-email-mst@kernel.org>
 <MW4PR18MB52443417B7398C64244F838BA6522@MW4PR18MB5244.namprd18.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <MW4PR18MB52443417B7398C64244F838BA6522@MW4PR18MB5244.namprd18.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 05, 2024 at 04:23:25PM +0000, Vamsi Krishna Attunuru wrote:
> Hi Wang, Michael, Jason,
> 
> I wanted to follow up on the previous discussions regarding this new used buffer notification suppression.
> 
> Since this proposal involves two changes, how about separating it out and explore the feasibilities to support interrupt coalescing with existing options.?
> 1) Support pvirtq_event_suppress/virtq_avail in PCI bar
> 2) Support used buffer notification coalescing
> 
> Regards
> Vamsi  

Indeed, since there's a lot of controversy, splitting the changes up
might help move this forward.

