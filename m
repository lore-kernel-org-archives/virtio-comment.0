Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FB82E851
	for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 15:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718120934; cv=none; b=sqS2p2JEbnaPv24oOtG1+AjtWYu6WfIWRO5tS1MVd9BS0icccUKImO7g5wHcljiB7Tze78vdGrx9l6LgYQ92lpSXwktgk9Kg35zzTr7KzTK6dTv87rXaoq08X5BaZ80kUOYqGQg7gzU3EEcM/33hkyxIeGjwf2Fk9oh2klklZAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718120934; c=relaxed/simple;
	bh=up28L1LU/ReCswS1TrfFigSZHY49it5hEJTg5kWUVqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=n76p3fqFWqNz97pOM3/nreVYzOMrqKKopp6ys0SCRAhnTrOcaowTyW698oJBvmOYzTwxwFldOzIfBlfZlhq8529nu728/7NHncKrYnoc5y/Rb94T/Lx92nQXVJrFJUB8AOgmNuldzzv/GmCubLDMXLriLnEg9qxNL75MnZVFeUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DpGQpq0Q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DpGQpq0Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718120932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JKfHgGPOhJ/DbhZUo8FDk5MtDdWnhjXnyJBmA1gCbRE=;
	b=DpGQpq0QETPUF5pJBXquDw1BuvUwyBoV81ME02XSsBUaTYhLQ1AWsYFYc1lbClhT8BjFvG
	79XQ09CUkMPE4yWnmy5Pz8/1ZqWj5E1+xNsGzEb6RwgVx1F58TKOjX/zpLN52l56PRlM9p
	gcicUJKQeZjCL/CTo9RojPRzPr0vlWM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-T7q7xjgDOBSvgaZOY62Ifg-1; Tue, 11 Jun 2024 11:48:50 -0400
X-MC-Unique: T7q7xjgDOBSvgaZOY62Ifg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4216dbadb75so26772995e9.3
        for <virtio-comment@lists.linux.dev>; Tue, 11 Jun 2024 08:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718120929; x=1718725729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKfHgGPOhJ/DbhZUo8FDk5MtDdWnhjXnyJBmA1gCbRE=;
        b=lb45s3yEV49Ql4r5H3zckDpYmayTDZw6gA4tYo6/KKt8KO2PvUaikPMqhJJZCtO28b
         SgXGua6IqShAj5dmZdWoPfoxNlA28PVKY+NA/du6GDLlEkqqjF/0pO0+r7D+w2y41+IW
         Ji+8WAsu4120eyLWDKnrkPeuNCiOdGrpiLGGIvAxKCdsvDqiCTpgFDAU/ixRfavfRff5
         c49SOu+V4iZmFT6kzbxtq+2i+HJc/W/g4pgvgjmbG2cYrC0YnCgh3nSCYjAztv+QOpeu
         z43bV1Ec5rX7W4LSAPjAUgpbyIrXfUFBXbXCPYowB1peUY26ifqrh0UNnabiX/MUd2Al
         +uhg==
X-Forwarded-Encrypted: i=1; AJvYcCVtZ96LA9ADxFIqEYL56cZMcDyKO9T80qFG7V97/34mbxqDGWbUVOrrvQA6gk8ATZgahxA1D6xdaj3JL5ZeX7ZLKnlACk1MmshLr0nQmZE=
X-Gm-Message-State: AOJu0YwDLbXrjBAhvUhdw/0wB2p1AI+vZLJcoLR6plOLRCTNQZvcNQxc
	SP8LkNbPYbKk+96CRwohi81RfVHQayt2+PK+3XnbXAWyHnahrmFIj8uokRQ1PJIrnspMWFF9VyN
	PFfAirou56QosKH528JMGgwOvtMntP/8hX6LeoAAIx/gD7r5lqCGVASo9b3AGFflfGOMCe42W
X-Received: by 2002:a05:600c:4f0e:b0:421:c932:f5da with SMTP id 5b1f17b1804b1-421c932f93bmr52048765e9.0.1718120929511;
        Tue, 11 Jun 2024 08:48:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZtGlKBCtdKRrV4MER9dLcsrVxOzgO1hr+7Qb3C+InQVdnEj2ReFwjWjHMHqz+VD/rUl8hQw==
X-Received: by 2002:a05:600c:4f0e:b0:421:c932:f5da with SMTP id 5b1f17b1804b1-421c932f93bmr52048605e9.0.1718120929123;
        Tue, 11 Jun 2024 08:48:49 -0700 (PDT)
Received: from fedora (lmontsouris-659-1-55-176.w193-248.abo.wanadoo.fr. [193.248.58.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42161147811sm167299005e9.18.2024.06.11.08.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 08:48:48 -0700 (PDT)
Date: Tue, 11 Jun 2024 17:48:46 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Harald Mommer <harald.mommer@opensynergy.com>, 
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH] virtio-can: rephrase notification mechanism
Message-ID: <htuig3q24efrbkirbsfdi46eretgmaupyz7tshksmix5tehsmb@qyg4q46zhmh2>
References: <Zkyr3eaCOctSn7BD@fedora>
 <7wfenngxylsnl73xnspd7r7icc5upuopxcr353tddxpiqlcp2o@4juhjr3m4m3v>
 <2e87edd1-897f-4969-a479-3b1b59529ec1@opensynergy.com>
 <ZmGD4CufscIixGTo@fedora>
 <ibghaokieygbzjjhufda7d7dufpoz2vv3weapybu6yavllcinr@6n2s57dmrofy>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ibghaokieygbzjjhufda7d7dufpoz2vv3weapybu6yavllcinr@6n2s57dmrofy>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 11, 2024 at 10:36:47AM +0200, Stefano Garzarella wrote:
> On Thu, Jun 06, 2024 at 11:39:44AM GMT, Matias Ezequiel Vara Larsen wrote:
> > On Wed, Jun 05, 2024 at 07:55:05PM +0200, Harald Mommer wrote:
> > > Hello,
> > > 
> > > exactly this is my problem here also. For me this change looks like saying
> > > exactly the same thing just in different (not better) words.
> > > 
> > > Thinking still about the replacement "from the driver" => "by the driver".
> > > Was the original "from the driver" correct? My native language is German and
> > > of course it can be that I made a grammar mistake applying German grammar to
> > > an English text. Absolutely unclear to me.
> > > 
> > > But if it's not that I have as a non-native speaker of English in the moment
> > > no idea where the improvement is.
> > > 
> > > Regards
> > > Harald
> > > 
> > > On 05.06.24 10:46, Stefano Garzarella wrote:
> > > > On Tue, May 21, 2024 at 04:12:45PM GMT, Matias Ezequiel Vara Larsen
> > > > wrote:
> > > > > Rephrase the notification mechanism.
> > > >
> > > > I'd suggest to explain here what are we clarifying with the rephrase.
> > > > Sorry, I'm not a CAN expert, so I don't understand the difference
> > > > between the two versions.
> > > >
> > 
> > Thanks both for the review. The only sentence that I wanted to change
> > is:
> > 
> > "As the configuration \field{status} change is caused by a request from
> > the driver the device is allowed to omit the configuration change
> > notification here."
> > 
> > I though it could be rewritten in a more direct way like:
> > 
> > "The device may omit the configuration change notification as the
> > configuration \field{status} change is requested by the driver. "
> > 
> > But I don't know if that clarifies anything. If not, we can drop this
> > patch.
> 
> Yeah, I think is more clear but I suggest to explain it in the commit
> description as well.
> 

Thanks, I will submit a v2 adding that.

Matias

