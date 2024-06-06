Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B288213E41C
	for <virtio-comment@lists.linux.dev>; Thu,  6 Jun 2024 09:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717666793; cv=none; b=M38yRudLZujrkpvalUaZ8XNffCJNhFcUvN6y5yS9Xa14DwU8NkANUnEHYKtfJ/YYVpZGhSCwMaiC9v3FeTYaMYsLbDQl4E6tgV/n3O6vJNo7VLXD2ty3HFpUgrc7tEYplw9fIMyKIPGE2mpQrhk1hTBMiErr9bKXKt8CgoqSuYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717666793; c=relaxed/simple;
	bh=zI2VJm9kNS/56HDBr7wgVbbfE5CkBk6y4nBpCG9zQpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=sU5ra8QbbMJMxXgXkI7szhCayvPxdX/FNvnR9ogWLwvY65mUYxtzQuuYOYbrcw2KxKdiyJ6m5i2j5Vku6JZnRt8W0MFg9oD4xDiYN1QZCG6STCblK3cNnI74Gd20qqQnljZazlwOaEgmjdyOM8vdpGwlySnRt9n0PzN4ro/Imeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BOTilWCb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BOTilWCb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717666790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+PP88f1TW0WGCaZMKE0OQ8X8Hn+vG7S+FYoiKk3Z60s=;
	b=BOTilWCb4zLnEXcl7hAJmU7DrmPyEOhJcy76UACVnLzGkQuCuQ1hMyki9gqaOGe/I1qcQH
	oTQibhdoi2bdLJegETSkYNw2PRh2vdjzPbSFYpPdgkaYhRcI/xjw8vPn0XHQLvhsCL3LFn
	g6godp519Tbieqyv7LcNcMzWB0TC934=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-fojaSrhyPVG9YX7RIkiZDA-1; Thu, 06 Jun 2024 05:39:49 -0400
X-MC-Unique: fojaSrhyPVG9YX7RIkiZDA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6aecef9ae19so7767216d6.2
        for <virtio-comment@lists.linux.dev>; Thu, 06 Jun 2024 02:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717666788; x=1718271588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PP88f1TW0WGCaZMKE0OQ8X8Hn+vG7S+FYoiKk3Z60s=;
        b=fYcyafyWJ+CkYxlkyb/O7xQpPciPoT0uxBx1/rWLrzLpoOFeVQk+9zSs7cOV4AuJPM
         3Z9f8S/+q4Tlkwl1OjUniKqUJ7amkrq6uO4gZZedjtLlql8h28lJ5HXMNs6iuqkacl23
         B4F7RutAVPLICmONFO38IHNXI/5nAZTyIbPlUvj98UZhW8H3ApRcMGBZWwS/Cy3FYRB5
         au1pAGDibsDT+0BJVmEW9u/lLIqZ9Byq62MNmx430TaxElsbpiHSXnvf8tJmSyW60ijq
         ntewjPkrgGMhpZuy7pkIjzwFIg1wCCnJdNvxqLnqUWNQSCOFSAqN8mDRfcIiAncWv+TK
         g9yA==
X-Forwarded-Encrypted: i=1; AJvYcCXv+GHwciBTM4PUj2FKRc00YrsN3n3DdcCeVgAd/sJjrehta0MOStWIXO4KFySOQCBu7uEmtP+GynTPtEjulTYLLc+tq4nV2+d55f0mSWo=
X-Gm-Message-State: AOJu0YzWSkZGaAp7I4oZM/cDLKWMJPhgy8w9W/5lLU5K9fCaUW2v3qRS
	OQL80Jc6cH16VAcH6LTVdTCMRkIc1El8Gv/LVqpb8CSycBiPqT7sg0lcsXrCLpFbGPpc8WfKZmh
	Zl8Q0ruD1XCP+MjBcHb7ZG6pqI5giSByfUCkMvLsMN0cjIj3Gfzo2H0DlwIUT8m11
X-Received: by 2002:a05:6214:448c:b0:6ae:2a6b:de8d with SMTP id 6a1803df08f44-6b030a8866fmr60075596d6.64.1717666788461;
        Thu, 06 Jun 2024 02:39:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOAd0keGFwDKQL6Jjxj6O20EqCzH1CXBK/2/vF0Rl3M0SrevwJxF8xqh7/W/xsA2t1cu+QxQ==
X-Received: by 2002:a05:6214:448c:b0:6ae:2a6b:de8d with SMTP id 6a1803df08f44-6b030a8866fmr60075486d6.64.1717666787997;
        Thu, 06 Jun 2024 02:39:47 -0700 (PDT)
Received: from fedora (lmontsouris-659-1-55-176.w193-248.abo.wanadoo.fr. [193.248.58.176])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b04f9dfbefsm4548836d6.111.2024.06.06.02.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 02:39:47 -0700 (PDT)
Date: Thu, 6 Jun 2024 11:39:44 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Harald Mommer <harald.mommer@opensynergy.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH] virtio-can: rephrase notification mechanism
Message-ID: <ZmGD4CufscIixGTo@fedora>
References: <Zkyr3eaCOctSn7BD@fedora>
 <7wfenngxylsnl73xnspd7r7icc5upuopxcr353tddxpiqlcp2o@4juhjr3m4m3v>
 <2e87edd1-897f-4969-a479-3b1b59529ec1@opensynergy.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <2e87edd1-897f-4969-a479-3b1b59529ec1@opensynergy.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 05, 2024 at 07:55:05PM +0200, Harald Mommer wrote:
> Hello,
> 
> exactly this is my problem here also. For me this change looks like saying
> exactly the same thing just in different (not better) words.
> 
> Thinking still about the replacement "from the driver" => "by the driver".
> Was the original "from the driver" correct? My native language is German and
> of course it can be that I made a grammar mistake applying German grammar to
> an English text. Absolutely unclear to me.
> 
> But if it's not that I have as a non-native speaker of English in the moment
> no idea where the improvement is.
> 
> Regards
> Harald
> 
> On 05.06.24 10:46, Stefano Garzarella wrote:
> > On Tue, May 21, 2024 at 04:12:45PM GMT, Matias Ezequiel Vara Larsen
> > wrote:
> > > Rephrase the notification mechanism.
> > 
> > I'd suggest to explain here what are we clarifying with the rephrase.
> > Sorry, I'm not a CAN expert, so I don't understand the difference
> > between the two versions.
> > 

Thanks both for the review. The only sentence that I wanted to change
is:

"As the configuration \field{status} change is caused by a request from
the driver the device is allowed to omit the configuration change
notification here."

I though it could be rewritten in a more direct way like:

"The device may omit the configuration change notification as the
configuration \field{status} change is requested by the driver. "

But I don't know if that clarifies anything. If not, we can drop this
patch.

Matias

