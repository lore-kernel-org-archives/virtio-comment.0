Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A243A1C9
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 05:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718170863; cv=none; b=DOkBbEm87J3lfj83tOSnuhEwVgEpO0ByDx48uJvY/+dXcOkeJAyasQKEO8vLBHsCeMKmS1RIUh+ziQPchK0kkYPoGZdnh+Ft0RjnuxldA0LhNxLz9e4+LU//YweBvmQ/pSYXs/nMlmqLzaAYFo+kXfwM9wkSpSRWrjoo/vOn6YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718170863; c=relaxed/simple;
	bh=fq2tcqwpZfxWraWbby5gnwgDfA6WFwU5NC1zSmpQS5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Riq8EPDnDG9y/0lj1T+8j1QGX/eNOTr2rqRXzjiaXBEBtiKAAOOaWZhrG/gaChqNOGSbnHsK3GTEtD1619SuouDoGXMJUoWulZY4snrrfYrkIJJTeIoXkWkXk6G5JOJsp980ru3tNhY7unAIkZ4LTcOI5oBusU07tnB06mCO/qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y9AcPGll; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y9AcPGll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718170860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vmiGUiKWRqkfdHQlFEYjizNG5iqlhe6WFFs3q3awMvw=;
	b=Y9AcPGlleNbLuLKhpPZFOU5nfRF9+4cBgFf22dwq69cmnElrxBEMfAC0WOvcJ6i1VGBJZ3
	Z1c+YygCf1Gi96hvgCb72wBnUDfIaOjuP+XIhOpx58hSLh3fyZbpPR6mcovlRo/JVGtu//
	s/L4E/8Y+nNmdJJlsRhoP3w3bVlEO7g=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-JtMmsE9oMgC0ggVo6vD55A-1; Wed, 12 Jun 2024 01:40:58 -0400
X-MC-Unique: JtMmsE9oMgC0ggVo6vD55A-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-52c893408b5so2238030e87.2
        for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 22:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718170857; x=1718775657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmiGUiKWRqkfdHQlFEYjizNG5iqlhe6WFFs3q3awMvw=;
        b=T5cjc+5ULXQtqxNT3C++kX0ycfIpLFXwHUE9ZLlmOcPO6mNhTkfZ3QIz5KLp7xKKUy
         Zi0CKCrBxyFWyOA3FV6FrqWOM/OL+de2fJcp+uWlM3t+b0z9hKheFJNHvxCJg3sQORXP
         GCHhIUUgUVBnd8Cx00SKjEV4LhocNLh75mF8FX0/4bB4Ra3li9ntMSL/P2GQsZkmUenb
         gAE6CT8JLLXrMOdZsu/mPA39sN7LGAjQVUuVYM7acz0MiieTeL60AR1xYUYVjxWTVolP
         TO8YNc3aHUtF4UQEvCSTVRGKeRQA0kPFYpmNXfgEYJ3A+IobJVM/wVn3iE4Q6HjocD7J
         0odw==
X-Gm-Message-State: AOJu0Yxh97XB1yuTEYPbyiKoGtRV+9vfCSJ3CoDRTws+M7XR/AVEMCe6
	/mDFG78OJ6sGvIiSxAs6nVwMNcM4BqTpgwvT/KkY2c8gXxzNTjSfOll/UtrBX5eCJJqpTjQi1ty
	iT0IRm+CkiabkarzABIoDKXTh66BpxFLQnMp0HLtwsJr7bmcimBp0KFH1MA4c5zzf
X-Received: by 2002:ac2:4645:0:b0:52c:8fba:e2a1 with SMTP id 2adb3069b0e04-52c9a3c6fdamr376038e87.18.1718170857215;
        Tue, 11 Jun 2024 22:40:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqFCWeZS7Rw4U39qRiPux51n+xtF4cRFwjAneLO3qsqGWlgufXmFmsGrRKcM22bMO2Rz3G5Q==
X-Received: by 2002:ac2:4645:0:b0:52c:8fba:e2a1 with SMTP id 2adb3069b0e04-52c9a3c6fdamr376028e87.18.1718170856667;
        Tue, 11 Jun 2024 22:40:56 -0700 (PDT)
Received: from redhat.com ([2.52.131.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286ff39dasm11171365e9.17.2024.06.11.22.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:40:56 -0700 (PDT)
Date: Wed, 12 Jun 2024 01:40:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>
Subject: Re: [PATCH] content: Add link for the feature bits chapter
Message-ID: <20240612013634-mutt-send-email-mst@kernel.org>
References: <20240611175721.2550759-1-parav@nvidia.com>
 <20240611190949-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813E40929A98725186EFA0DCC02@PH0PR12MB5481.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54813E40929A98725186EFA0DCC02@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2024 at 03:51:48AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, June 12, 2024 4:42 AM
> > 
> > On Tue, Jun 11, 2024 at 08:57:21PM +0300, Parav Pandit wrote:
> > > Device common feature bits overview in the basic facilities and their
> > > actual description are apart by 24 chapters.
> > >
> > > Help reader to directly reach out to feature bits definitions from the
> > > basic chapter.
> > >
> > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > ---
> > >  content.tex | 10 ++++------
> > >  1 file changed, 4 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/content.tex b/content.tex index 8849522..c3531e2 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -97,12 +97,10 @@ \section{Feature Bits}\label{sec:Basic Facilities
> > > of a Virtio Device / Feature B  Feature bits are allocated as follows:
> > >
> > >  \begin{description}
> > > -\item[0 to 23, and 50 to 127] Feature bits for the specific device
> > > type
> > > -
> > > -\item[24 to 41] Feature bits reserved for extensions to the queue and
> > > -  feature negotiation mechanisms
> > > -
> > > -\item[42 to 49, and 128 and above] Feature bits reserved for future
> > extensions.
> > > +\item\textbf{0 to 23, and 50 to 127} Feature bits for the specific
> > > +device type \item\textbf{\hyperref[sec:Reserved Feature Bits]{24 to
> > > +41}} Feature bits reserved for extensions to the queue and feature
> > > +negotiation mechanisms
> > > +\item\textbf{42 to 49, and 128 and above} Feature bits reserved for future
> > extensions.
> > >  \end{description}
> > 
> > Not everyone is browsing online, printing and reading should also work.
> > So no need to be cute, just add (see \ref[sec:Reserved Feature Bits]) or some
> > such at the end of the sentence.
> Does hyperref break the printing and reading?
> This didn't add any extra text for reference and reading in PDF was fine like before.

It does not break it but it is not visible there - you are either
saying the link is helpful - then it's helpful for everyone,
or it's not needed then we don't need this change.

Just keep things simple and consistent please, we use \ref everywhere
and hyperref for external links. The rule is broken in one place
in scmi we should just fix that.

-- 
MST

