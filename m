Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFC81EDA1E
	for <virtio-comment@lists.linux.dev>; Tue,  4 Mar 2025 11:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741088691; cv=none; b=tJPtHuJVTWAAH5b3B4w9DmcfC60E3R4BWLLiK0QJi4+hFWlFD56wRebRfcGxLo8aprkvcHL8NY/2O+CNdAeW4Xb515hgPsHPiD4xf3V6AO+Dm1cu8GkWa7BuXzjL9XEAg7xVxxDl7g5UGwaDSJkKuWdnC1Zwnec6cjgFfSCDIbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741088691; c=relaxed/simple;
	bh=MIn3PnFd1kv7Q0NylDBS51pvaDNn+5UxBTGVU+ZXy9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=SOPMwkarpc3K+G+14T5AyoKwM8trTvl0Zw9fvmr39xhzFYcLd9BiTF1QOcQJyuLhnf/Zus8QJDCxqMDCCFeuDZvDJ+lcG3HY6hjAT5KfF/FM16XTJdbz2js7bmZw3hmji0DCCa7boB7E1vIvgwG6w2r1jUJPoY3L7cRNvzNlp5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aVLGcWjI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aVLGcWjI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741088688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kt8GrdeD+/rbO53kj0m0X7FqnH9WeqeY2nrNbI1NALg=;
	b=aVLGcWjIQc0EL74Lwfey24MPw/1qADa9pmhKWyYfpKTTLnZbW7jgwFzoeeDik3MXYaJ0fy
	Asl8f+gYJj2Bqy3PiVLd+PX4LSxE/gwr2XiICxpP9Lm2jgsD9PwqcPhiztmJt+64eUQ1Xj
	3pLGeqlnOHOcik7dTPagoMiI7PcdsVw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-_cKdhy_aMoezyuVwlWrDog-1; Tue, 04 Mar 2025 06:44:47 -0500
X-MC-Unique: _cKdhy_aMoezyuVwlWrDog-1
X-Mimecast-MFC-AGG-ID: _cKdhy_aMoezyuVwlWrDog_1741088686
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-438e4e9a53fso38983605e9.1
        for <virtio-comment@lists.linux.dev>; Tue, 04 Mar 2025 03:44:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741088686; x=1741693486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kt8GrdeD+/rbO53kj0m0X7FqnH9WeqeY2nrNbI1NALg=;
        b=ZUMLdRaLsU7Q3M/8RXDKI26pLt3VBUhDqNuPWmW4P0Wpn6EbTt1pmhe6VpQ4aaupwz
         AYeU6GXqTYjbHK5f+N8pvDvOYzAWt3mgGQA1qftKuljcp7zb45tmi7v1+3DxZOEUvMBy
         MoxKMtFPzpkLSyfAiAJBzhFBnjSBBj5RwUNiAC7dbYXkfunjlee49r+L34rjQCWsk8ls
         F0UloQPwZBRha8seQQd17H/KoNGFI3pHQnSGjd84HqFZv70Jh9uUXjuVpoBdrSTO7oBV
         Mz+HUyyxiGErJaLP0HyZJ+yJluIW8P8QNeQ2owPW5QVEeGZpe3X7IM9V79Hu8dP5lqAN
         4wRw==
X-Gm-Message-State: AOJu0YyhfR56F+ScbZCOuAF9L2/0Oxy1xxwwbevpL2ed2NIKWkPHco/6
	G47R5yqJBBFN+9Tlj66qeipfAHvCn0FQ9dWJ8CFihTcZZ6TVcNk2tVsmFTUekBz6FWurmkYJsCf
	4yxkdkAFSIcOwJNGqTz8QaL7a+UB07Kmkkc05JfcUslF+R4Kp8gJtOP8dIWj8XqGYRbIYnAVF
X-Gm-Gg: ASbGnctM42T4TBXIYJv32XxBQcbpbJ8iJeVupZyGJA3j7EWrv6AXOHAWdRrddJNZVs6
	C0xRLYNEyZOAd4cvcj38YLhQW0NKd7mOlGNy92T7sn+vDoUY6bKy8aUka2mLoN3eHD+Az0Jk6mH
	5d0Q4erUM+7nSEFokocMOG/08UP1coxTqketNlzwOs88+sjSKOWQ7mr7LL3bUxbmM3KkER4P2LT
	tJR6Sd0okIkVzuZKEq390HZAIT8sKBGoEPqGllZ8sR4exxU80aC0dA0alHZJIXjjdtM2blT6mWA
	/qY2dyH/2w==
X-Received: by 2002:a05:600c:5cb:b0:43b:c962:ad1c with SMTP id 5b1f17b1804b1-43bc962ae71mr45318415e9.15.1741088686212;
        Tue, 04 Mar 2025 03:44:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmT6A2h3BkQmDOzkEfLuRBj2Uqs/XBGLCkpY1NmZ/xkCD0JSq1uHaFPhEZc8OoTTLNX6275g==
X-Received: by 2002:a05:600c:5cb:b0:43b:c962:ad1c with SMTP id 5b1f17b1804b1-43bc962ae71mr45318185e9.15.1741088685822;
        Tue, 04 Mar 2025 03:44:45 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bcc8cb8c9sm16323585e9.35.2025.03.04.03.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 03:44:45 -0800 (PST)
Date: Tue, 4 Mar 2025 12:44:38 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>
Subject: Re: [PATCH v2] README.md: add example email for TC vote request
Message-ID: <Z8bnpjiYpmiFH7+7@fedora>
References: <20250227150241.1274768-1-mvaralar@redhat.com>
 <CY8PR12MB71951BEE03E73E7CF1715A91DCCF2@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CY8PR12MB71951BEE03E73E7CF1715A91DCCF2@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: P_CZ9HeN1N0LjYp4bUEqM6zGHWDkK5Ua_-KwXgj0F4g_1741088686
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 01, 2025 at 06:08:32AM +0000, Parav Pandit wrote:
> 
> 
> > From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > Sent: Thursday, February 27, 2025 8:33 PM
> > 
> > Acked-by: Cornelia Huck <cohuck@redhat.com>
> > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > ---
> > v1 -> v2: add Subject and To
> > ---
> >  README.md | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/README.md b/README.md
> > index c06caf6..731838b 100644
> > --- a/README.md
> > +++ b/README.md
> > @@ -206,7 +206,16 @@ The mail requesting the vote should include the
> > following, on a line by itself:<  <code>
> >  Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
> >  </code>
> > -(NNN is the issue number)</li>
> > +(NNN is the issue number)<br>
> > +For example, you can use the following template when requesting the TC
> > +vote:<br> <code>
> > +Subject: PATCH [description of changes]<br>
> > +To: virtio-comment@lists.linux.dev<br>
> > +
> > +Could please open a voting ballot for these changes?
> > +
> > +Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
> > +</code></li>
> >  <li>Please make sure to allow time for review between posting a comment
> > and asking for a vote. </li>  </ol>
> > 
> > base-commit: 124fcd0e97f209aab19639e7369116d99ede22a2
> > --
> > 2.42.0
> Reviewed-by: Parav Pandit <parav@nvidia.com>
> 

Could please open a voting ballot for these changes?

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/219 

Thanks, Matias.

