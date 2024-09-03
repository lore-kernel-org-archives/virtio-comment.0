Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2701A3AA3
	for <virtio-comment@lists.linux.dev>; Tue,  3 Sep 2024 10:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725360701; cv=none; b=q6NoEGBXNi27DVzAOUa19as38JUHmmLbcj5+kN1W5ajgTIdiIcPNw6d2nl/eZGRajtnZ/aYIcBR6MeB4VFLBdE1Hbj5rYcz7XcWCFMAE8/fbWBAGpjoLGdCImmeOKXUua+ApgSC94fcTEHhPKBSazMifQDxGurlTxGci8BJAe50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725360701; c=relaxed/simple;
	bh=dhXKXJfnToqwyyu+mX0bqY+ZCCTW62rxxVAYS0k1zaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Pp+wnTuYaHSUtWdxzpJBOAg1yrFY6ygZlhOgLQotJBN4bMyvbNHr0LDXIcQ2GkSjceg0kGUKu1su74bDAPmhS+TUlQl48sEa34bU4vq+dd9k1vHOCIRu3gZaWDJyszUd+Au0LD3vs1gna8C5mWz/oKJ9SndugmFxy2roDBAx9wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dWBNYhgh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dWBNYhgh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725360698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s5R6fo/Z+k/YZAirunR2FKlk3tuUvMfVLphIZIYE464=;
	b=dWBNYhghugfPncheLWiymI7GjRcf6p/oYKvqN39hb0DQnMHIwzUI9Mu6AVIuQ5upLmVl1a
	IJJPF+qZirv9BFYqU5iRP08W7p4wp7NOMpumSwe14s5CYdMNuvKto81bsaNdfMgbkJpsQq
	fzbciQaWBR+kXRr7hD46e4vjskOzulg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-Mqy7hTw7NQuKBxgMd6QToQ-1; Tue, 03 Sep 2024 06:51:37 -0400
X-MC-Unique: Mqy7hTw7NQuKBxgMd6QToQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-374beb23f35so2134133f8f.0
        for <virtio-comment@lists.linux.dev>; Tue, 03 Sep 2024 03:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725360696; x=1725965496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5R6fo/Z+k/YZAirunR2FKlk3tuUvMfVLphIZIYE464=;
        b=j/d/7fUdlKTNeQx+oxUO2CcDg8LljPOaksLTW1eJjSvPghzvht64PBGNJVwTEa3kaL
         D53XwVUGSKJ5hCMzFVMTOlGWrWxPMgXeWkSH1DeL+m9Zr8ABy+rPlVPosfaFPA3UIBNH
         iGRCb9U40zShcggIrImaFEXdDOydLvxC9kuXOYvyB7cRAM3ZJtymapc9RADjdN4cAC2t
         vRex2hTlKXOcf6POJkhv5yIYTTeXSshVqHyLjYhj80srLoX55BbjVyfWvp3hc3mJSy+O
         9iopXldPv2mmaQ3pwbeEO6C/GaCcDAJ6eKWf9DoaAR3B1Vu9WC6UNInOwS6qzrdSi7f1
         TNKw==
X-Gm-Message-State: AOJu0Yx5vrBI5noltO4pBGUI0CNfIJrRX7lKwxZ0PowxpQ8nCmQfqpqZ
	j1Irxzvumvg6eqO6jCCrVph4Z3fgdUGbFtgI5pkG9mROTR+CCdCNX6Hc4EsZM+D6VpRdp/crWyI
	cWLhp/yJ9GmFUfy1pMBBsvfIFKd/ctkDwEWHN+JcKW30UdM8xMan08qRWsrr3TDfH
X-Received: by 2002:a5d:4046:0:b0:374:cb62:b6f1 with SMTP id ffacd0b85a97d-374cb62b83cmr3984079f8f.15.1725360696007;
        Tue, 03 Sep 2024 03:51:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELsFTMXUw+ey7/uLeQ7dnO5ezLoktDZOcepO0kb1Wc6v7du5l35smwUdSLIVmagSIXVk1BHQ==
X-Received: by 2002:a5d:4046:0:b0:374:cb62:b6f1 with SMTP id ffacd0b85a97d-374cb62b83cmr3984044f8f.15.1725360695123;
        Tue, 03 Sep 2024 03:51:35 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:95c6:9977:c577:f3d1:99e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c39eacdfsm7758464f8f.42.2024.09.03.03.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 03:51:34 -0700 (PDT)
Date: Tue, 3 Sep 2024 06:51:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: virtio-comment@lists.linux.dev,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH V10] virtio-transport: Add a section to define mandatory
 transport requirements
Message-ID: <20240903065010-mutt-send-email-mst@kernel.org>
References: <4c24ede14e2545b2e9c69e7d9b79dc15744fd965.1723647318.git.viresh.kumar@linaro.org>
 <20240903103815.pqjdjyedsqy3vr3y@vireshk-i7>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240903103815.pqjdjyedsqy3vr3y@vireshk-i7>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 03, 2024 at 04:08:15PM +0530, Viresh Kumar wrote:
> On 14-08-24, 20:27, Viresh Kumar wrote:
> > The current Virtio documentation lacks a set of generic requirements
> > applicable to all transports. Defining these generic requirements could
> > be beneficial when integrating support for a new transport.
> > 
> > This section outlines the essential requirements that any transport
> > method must adhere to.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> > V9->V10:
> > - s/multiple// and s/employ/use/
> 
> Can we get this merged now please ?
> 
> -- 


You want us to start a vote then?

