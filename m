Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A40ECF
	for <virtio-comment@lists.linux.dev>; Fri,  5 Jul 2024 08:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720166443; cv=none; b=vAlB0DPlImP+NvBuslj/b0l46P1Id1U1a5P/PXxFq5kw9QY0JPeenS5min7DOQiLOnm/P31YSJKErvbxTu2I/9ijeTZfJbmFcDWHD1J4bui5k4NwkkIHM6z9nS/mKuESPy1+NejF++QfA5K2Didp05KUL09zf93swEKrtVA+GwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720166443; c=relaxed/simple;
	bh=i9rJKpj2K6I9/G8bBXgpMJWzAGq1tql0i+QvAEw9lFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=uVkmpXwfKx8W5Qu3qjBKoNlgFrw9D+TfbMve0X2UYvTeEH3pme7zfb6OMO4AiMSgDPJrjPGDEPgdpiE/qWaoWRavkvTegF4LjPYvOFSY2beG4d7LiOlNlESyyQZQatqxwqVFt8GAQwMu+xAGpmI+Ks5/9bmqF12L5WldnvzEpT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UVvkougL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UVvkougL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720166440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=khPeW4gWnD2LccTeDSnAU/nhkkLWBtt/RQ0x5cEN8X8=;
	b=UVvkougLxKjJiOf2Cm3akFVBKv2XHUmalNnjFC0gn3gwjqz1yWr2QTtRzIgpcP0z8dAmSj
	0euTjBGRL/GlOq8CzNhjCvyZFtPGU+zgnuWvn2VG7WtSgmDYrqiKg+j+yniCXwQfEfWHEm
	cina4tTRDH1+ZhVujXw18qGEkRWQFNg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-vjV3vINpOkesCqbpkacjNg-1; Fri, 05 Jul 2024 04:00:38 -0400
X-MC-Unique: vjV3vINpOkesCqbpkacjNg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a725b0f8ba9so60838566b.2
        for <virtio-comment@lists.linux.dev>; Fri, 05 Jul 2024 01:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720166438; x=1720771238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khPeW4gWnD2LccTeDSnAU/nhkkLWBtt/RQ0x5cEN8X8=;
        b=V4wZgh9awWQ3oPBiBJAtBh8868i1XuAiAj+RMNCs3nKb/asEtrwfI7waFAEPSc4DkZ
         Uy+ScHjPAUpWBSIBUDt+b4hSy/l/Gs0jp6LMyWca1HlHXO7D5E03gSX3W3IPQdASqvrV
         XL/XdKtvLwgjkGmVncA5FeFZg2Bsof/4CyAek8OeSZ6OoUbKtPXknA6EpQxwUeRmFhyS
         hzxN5VArJs1sS9RP5rNWBjMUff6DoEhPZ3HP2ge7kc9PA3+osbAEunZXIco/myJSQsei
         4COWR3f228ANgpS+SFTAu7DwLwelez7pkgPga16tWEZ09dGTXARl4HjbSd6deVLB3rg7
         qNVg==
X-Forwarded-Encrypted: i=1; AJvYcCUc1hZJPFjId3PyGP2mtSIMdjJouV46w4UImtty1YeOyeiDyzYojc2vtOj2bwaogX7Zlu0IkBG1ABf2d/2CRCdmsxhHON0YPTj1QHSSzrw=
X-Gm-Message-State: AOJu0YxzYZE7giV2C5bw6lllB4tU6ByOwPHfkWcsNbgyONE/sKx/A/Ep
	CEhl3VyoZKcdb1OQULeInWp3ZRNpgnSPqQGW3eG+Utk4M4NPc4yN86dxwOdG6dfvavmtecDFeCe
	R5HqJ4AumJiT22cEIX+S8B10nAG+JBJXihJKkIwalQQ4PwfSiGoHbJAzSF3MxVPnO
X-Received: by 2002:a05:6402:13c8:b0:57d:4f47:d9f7 with SMTP id 4fb4d7f45d1cf-58e56997566mr3859080a12.0.1720166437835;
        Fri, 05 Jul 2024 01:00:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEURiOXwMGrP6rgZYli+0NeejWa1B4ecgdkbFd8IQ3QpU2966KbxiJnvTBUsmffHGPedCLPyg==
X-Received: by 2002:a05:6402:13c8:b0:57d:4f47:d9f7 with SMTP id 4fb4d7f45d1cf-58e56997566mr3859046a12.0.1720166437217;
        Fri, 05 Jul 2024 01:00:37 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:1b5b:ac5c:b82e:a18c:2c6e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58f90b20091sm581751a12.45.2024.07.05.01.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 01:00:36 -0700 (PDT)
Date: Fri, 5 Jul 2024 04:00:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lege Wang <lege.wang@jaguarmicro.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"vattunuru@marvell.com" <vattunuru@marvell.com>,
	"ndabilpuram@marvell.com" <ndabilpuram@marvell.com>,
	"parav@nvidia.com" <parav@nvidia.com>,
	Leo Liu <leo.liu@jaguarmicro.com>,
	Angus Chen <angus.chen@jaguarmicro.com>
Subject: Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Message-ID: <20240705035755-mutt-send-email-mst@kernel.org>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <SI2PR06MB5385346C86CF45806EC6E9F6FFDF2@SI2PR06MB5385.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <SI2PR06MB5385346C86CF45806EC6E9F6FFDF2@SI2PR06MB5385.apcprd06.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 05, 2024 at 03:35:17AM +0000, Lege Wang wrote:
> hi
> 
> Thanks for your comments in previous discussions.
> I'd like to confirm that do you understand this proposal's idea now. If yes,
> I may start to prepare a more formal V2.
> 
> Regards,
> Xiaoguang Wang

It's not that I don't understand the proposal, it's that I don't
think it's a good proposal. It seems to rely on timeouts to solve
race conditions, which are all hidden outside of spec.
We should explain how things are supposed to work.

-- 
MST

