Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324AB4C618
	for <virtio-comment@lists.linux.dev>; Thu,  6 Jun 2024 19:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717703761; cv=none; b=gTGCJOiJqC3SQv0UM5ysRqhCqjK3sLIptMyT/W+chT0XvB3Oi/+F/C3VNkunyts8JWmJDsVttp0N64NgcDHpAxn1dAj7lp/LFLZKU6w8xKb7aBfp2Xti/7wvDr+3DPzUKA1jPKClAFISo/NKpH+XiQyUwfh+r2aiLFWEanjtfHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717703761; c=relaxed/simple;
	bh=MxgyjzripLQm95cfv7TGwxI1YnW54Fw5jSaIdyvNgRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=IX2XcBps2ffn34NKhNzZdNVpJh2f/wIXl9bX8cgTTeIpaGDqLv8dU0s4AVvrfEVy1MhdHxycjVzqCIclDqvJwoKF5P8Rv701TUiG0y90v8zDIlGAnSut0YGNxtz2MMyqH7wJx2Prb+B/pl80GiQGm3R47ZoZvTicstO+s1mDDd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SuRIX8T3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SuRIX8T3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717703759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i3kE820MMBiQGIMpAwyL0tGDxEWWz0S64hl+oIasHWY=;
	b=SuRIX8T3GLI+dfLvizomPtTvLpAnlodx/VuhIEeSd26mEyE8Ibde1Pej3Y6to4haGMhCS6
	458iwW5yM5TeWZ0C3cANwhyR7OWbF9ewMS7Jj+G1cYfFAqTDh2QKTIT0CNNu/K3D55eCYF
	0kDUHft1UparjwYj9HnlIVXSdCVC+Pc=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-IDmqX3B8N4OUZmnd2h9Mtg-1; Thu, 06 Jun 2024 15:55:57 -0400
X-MC-Unique: IDmqX3B8N4OUZmnd2h9Mtg-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52b86cce7d6so1020272e87.3
        for <virtio-comment@lists.linux.dev>; Thu, 06 Jun 2024 12:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717703756; x=1718308556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3kE820MMBiQGIMpAwyL0tGDxEWWz0S64hl+oIasHWY=;
        b=A+rg4LdTtrvMSf0EwO5YDzkiom/pdde0XBJ0rQ0kkjuaIVFQ6rkVnZ8tB/tihxQhbb
         dhfnJ9+9yXMx2dgZ0rcX4L7pE/nO+/pbxjFXPSvkjFlVzQe3MkryrXnNhn7pK7kDI87U
         7k8PhMkSeaX7+zFEHUFvdi0JkCElS3TFFbsJLYHLVfifZWi9TOn2pEOzHVueihotS4Hw
         SpBECTNqqDsRMKfFSyROAeljgeihh5HtSsthL34nD6y3uoApapppwZ0irxwi8ZXS35wj
         pjOWMQoJHFyt9OuNqHFKHA6jioc+coPj9RYFYDCHtq17CheeHv1mWClSnjjEGDU2Rh3I
         uXPQ==
X-Gm-Message-State: AOJu0YwqLtc2RAy+4inqp86oWFh23D+y60+lXdnvn8VOUJa7UtGwjJJb
	X6i6YGpfoY4EIJ0NwDSwmhUXQn6zxQW3rMjZd7dDE48ITkLfNVMG+ZjQE90MHBqnj0hW25cBy4p
	hqWGe9CfCeW8VZWnANm2/P9YdFwYMshvwB8YdV5J5rGESPsHA96kPwcTii9TUJfSW
X-Received: by 2002:a05:6512:e99:b0:52b:8793:3c12 with SMTP id 2adb3069b0e04-52bb9f5bc16mr494972e87.6.1717703756384;
        Thu, 06 Jun 2024 12:55:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLkjCzrOtz4JG6tnWinjOMJWiYKm8GdvCvNZSvWa/PDDLMGYFu/kTC+hhwImI+lgxhKTLB0g==
X-Received: by 2002:a05:6512:e99:b0:52b:8793:3c12 with SMTP id 2adb3069b0e04-52bb9f5bc16mr494962e87.6.1717703755827;
        Thu, 06 Jun 2024 12:55:55 -0700 (PDT)
Received: from redhat.com ([2.55.59.85])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aae11a98csm1570358a12.48.2024.06.06.12.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 12:55:54 -0700 (PDT)
Date: Thu, 6 Jun 2024 15:55:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: ballot system back on
Message-ID: <20240606145829-mutt-send-email-mst@kernel.org>
References: <20240606082035-mutt-send-email-mst@kernel.org>
 <87ed9akoab.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87ed9akoab.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 06, 2024 at 06:51:24PM +0200, Cornelia Huck wrote:
> On Thu, Jun 06 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > So, things seem to be working, even if they are
> > now a bit harder to set up.
> > Let's start wrapping up 1.3?
> > I think we need to pack up and then do a ballot to ask OASIS to get a
> > special majority vote for us.
> >
> > Right? Cornelia, want to start that?
> 
> I've now created a ballot to request a special majority vote; please
> double-check whether I got the incantations right.
> 
> And because all that work is not really visible: Thank you for getting
> those ballot scripts working with the new platform! This looks really
> painful and time consuming...

Yes it was!
But in two months we did not get API access so reverse engineering it
is.  What made it hard was that the new system does so much in
javascript. Both the login system (it's a single site why does it need
SAML?) and the ballot form itself (lots of asychronous stuff,
animations, even a simple checkbox is hidden and implemented from
scratch in javascript because reasons). So I could not just use selenium
APIs (wasted a ton of time trying to figure out why). I started trying
to emulate keypresses and mouse clicks but that proved too hard to get
right. In the end I hit on the approach of injecting javascript into
page to interact with the hidden form elements.
Thanks,

-- 
MST

