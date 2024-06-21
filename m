Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD69171086
	for <virtio-comment@lists.linux.dev>; Fri, 21 Jun 2024 10:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718964513; cv=none; b=tlKKA3wouJwOaGrXwQR7syG18nKXcHVWWV996FHHeKRbZZL10ni/mrVMPEnJ2suvhCkzHk/anIIAz+gNVdWeC8Dxj63M2/qtK05eIvUK/YL18mVzm7oW4Jq/URD0gUdvlBYx6nMyFkqG5aYNWVHTlHGVtu29/3AWTIin0+/PQM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718964513; c=relaxed/simple;
	bh=TWl5cS422dWcOv5p7G9yqqf3O8hiVSOqMkIlA7QUof0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=O5lnfFMMmKe+zG0aH4nZsAF4rdVKVXFVbPhN/0Zv1WmSZhT8wv1kgGisFL9g8F+Mf/x3JwP+hQGsxexcmBWM3nhmyd45brwWs1UVhWRuz5Lk9ag/mFdtq8nu9c7oR6X5wBbXsGl+3CF1rPGjJ2qHhieTCM9diMkogQkOj3J87Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PhSkqavO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PhSkqavO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718964511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=svDnTjLnBNMZU2WCRfNlbCOC/BmK/XBTYEFmYxFcjBA=;
	b=PhSkqavO6jONL0EpIuuja1Kla8rB5S5We6AuZObQNIpfFzLTXHdBK+kJF3BTGrzc+QwEnO
	yOo6ZyHG3ouVW0IBgj/NrWG3vnwrQZQOFVPobsRFTk9Q4tyFjoA7jW+7rE9rZU+vNzuKmd
	mRZHtyH0m5VdpbDcK0bkN1Jy3uG5uFk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-0S4e_RviOxK8dk5Cx2Q2Ow-1; Fri, 21 Jun 2024 06:08:29 -0400
X-MC-Unique: 0S4e_RviOxK8dk5Cx2Q2Ow-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a6f33c7ba07so93241866b.3
        for <virtio-comment@lists.linux.dev>; Fri, 21 Jun 2024 03:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718964508; x=1719569308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svDnTjLnBNMZU2WCRfNlbCOC/BmK/XBTYEFmYxFcjBA=;
        b=sGQrbdG6aLeFVHDp3OJOa1JwRZbwKSLiRifS4irYQZ7nVofZxC/ndqzttNGW+J436d
         KyDgaoeiGy0yWA+iClQl8m0UnrwjPN8fgqCY+4LbYJ/hsHMKy84kVgIv9PWTGOXx+omF
         y3ac+UJsBtpPYeFhihXOAds17MDdqSukkyFCDl84lmEj9LdAxSwcwgC1YzRq8UtF6LBr
         NfqniNL/l8JxxzpOqNJp7zVS9acMXWXfAbdXPHjmxQJabTThAnbamZ3xfpnjplaCsmog
         yc534XqlHRVln5DbTcOB2QX0mu1DA19cGKEOoXb+vA74gMjO7MMLyl8IY2NLPnoVwUvW
         6rOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAU3Lc8JmD/LTIh9Xhs/d/PmMf3775P3rcjmIPo1z5m4j4WlSLEx0cD3KdbYz6Ai7lQkAe5A1phsU0o3AqudBzszv+EvKj07hckuvoqSQ=
X-Gm-Message-State: AOJu0YxJnUvWTEcUFGMNyly4+EjFIz9PwDXzGcQaaJCjdxfCfafYzkdt
	Rln3BCNcJGaf4GAIAhYK7iaUjyiQZUCKp2wX943KDKrWW63P2JKs9iDkbZ2BBujn43sSbqXnZzT
	Xh08yQqSjlrjpGwbEu2s+uR79DcV3CWzRBDMqUC8Jbs7hFmvud/ylDXYvgrv8a1eGn/ksCVMG
X-Received: by 2002:a17:906:f246:b0:a6f:6d41:9681 with SMTP id a640c23a62f3a-a6fab779117mr477545466b.48.1718964507899;
        Fri, 21 Jun 2024 03:08:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYoL6CNVlHhejvnb6nRcRTq2y7P9mOHu6ZVxVtRkDfzb/Z+7a99Zh+5KhEYiufnvGU5RIE6g==
X-Received: by 2002:a17:906:f246:b0:a6f:6d41:9681 with SMTP id a640c23a62f3a-a6fab779117mr477542666b.48.1718964507173;
        Fri, 21 Jun 2024 03:08:27 -0700 (PDT)
Received: from redhat.com ([2.52.146.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560754sm66090866b.161.2024.06.21.03.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 03:08:26 -0700 (PDT)
Date: Fri, 21 Jun 2024 06:08:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	"stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: [PATCH V5] virtio-transport: Clarify requirements
Message-ID: <20240621060545-mutt-send-email-mst@kernel.org>
References: <9d543789de03d26a27a43ae8f7621d07d66e8731.1718084050.git.viresh.kumar@linaro.org>
 <PH0PR12MB5481413D59F2DC236F0B59DFDCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240611065816.lq3ehs7fmpjbihip@vireshk-i7>
 <PH0PR12MB54815595D5B533A6E38636F2DCC72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240611084103.3u7bsoe6nlr6xngf@vireshk-i7>
 <20240613093203.24hcx7euw6txy3zs@vireshk-i7>
 <20240621053854-mutt-send-email-mst@kernel.org>
 <20240621094335.ilvrwycyrzxjqao2@vireshk-i7>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240621094335.ilvrwycyrzxjqao2@vireshk-i7>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 21, 2024 at 03:13:35PM +0530, Viresh Kumar wrote:
> On 21-06-24, 05:39, Michael S. Tsirkin wrote:
> > On Thu, Jun 13, 2024 at 03:02:03PM +0530, Viresh Kumar wrote:
> > > On 11-06-24, 14:11, Viresh Kumar wrote:
> > > > On 11-06-24, 07:41, Parav Pandit wrote:
> > > > > Got it.
> > > > > I agree to Michael's suggestion "I feel a non-normative section is enough for this."
> > > > > So following his guidance, we should remove it from the requirements and have this as,
> > > > > 
> > > > > "implementation guide" or appendix section and it also looks good without the key wards too.
> > > > > 
> > > > > Otherwise, this requirement section becomes the example of how not to write normative in a normative section.
> > > > > (and we want to avoid future such examples).
> > > > 
> > > > I am okay with whatever Cornelia and Michael finalize on this.
> > > 
> > > Michael, Cornelia: Any decision on this ?
> > 
> > On what?
> 
> I am a bit confused about where exactly should we keep this section.
> As the current patch or appendix or somewhere else ?


Add a new chapter: "creating new transports" alongside newdevice.tex.

There, explain how to go about developing new transports.
Your text can be helpful there.

> -- 
> viresh

