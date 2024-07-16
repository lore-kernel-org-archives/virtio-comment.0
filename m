Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012881448ED
	for <virtio-comment@lists.linux.dev>; Tue, 16 Jul 2024 12:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721131469; cv=none; b=oXgFu0LLVO1c2Riww3a/2FBPkPcximPEIPSA99oCYG00zfttWxsPdYlTV4RJWdGNywNIit0YlyxIprVnEMrDBiWtMPhS9lFvYxH16ar4uQdWuyI/QBmnLRxMFsC5RpDlVvhTljSysk8mYLdK+IMDOanmCHzAXsdKnGVPE8LvVqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721131469; c=relaxed/simple;
	bh=b1OIDYwyCt7LPycWuinm/cwR3dsmo6YEgKAhqiuEZoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Oh2uAZsAu9Q6hn2R1R3t+o4HOPAAspCuMNyEGH/iLuntNM/RKxqm3YdKrXDOmD9US680HNiAQzoIR8NduJrrrdVn4NVP5Dat6/oGye8hzK8eH/ogt9tuGA843n8NJywammCFYG26gojfPaiKWefJ8zSxHDp6QQDnmmGuyeny1fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YuzUuWPA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YuzUuWPA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721131466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fAcXgXXpfZNy/qFhAJj+CKhJB/tWWPM6Sr4FZPu0sVE=;
	b=YuzUuWPAM9lAQVuC445tsB96feFWnUaAgTCf9QLkE/xIOXxivBiAJtwzhkuPY5IEOVhLZT
	/kufHvLTVPCkKaw4cEdriqjN0ycp/a1rQtNJxClzvWFc7zh8MdzRGJwbiZ+A4FKnd6Mqol
	N3441d4LW2xnZfRR1dKUAzWKWibeT/0=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-83rr1aY1ONmWloIrDqwSYA-1; Tue, 16 Jul 2024 08:04:25 -0400
X-MC-Unique: 83rr1aY1ONmWloIrDqwSYA-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2ee95497b77so55320711fa.1
        for <virtio-comment@lists.linux.dev>; Tue, 16 Jul 2024 05:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721131463; x=1721736263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAcXgXXpfZNy/qFhAJj+CKhJB/tWWPM6Sr4FZPu0sVE=;
        b=QL9+6rbWmIhNWIMN9j3RdEKOjJ/pKrUQ0sndI/wF9OlEucgdVd00pIPSkCe6ABvUP2
         DEjB/FgRQ3s18Dh2/Ub19d75PLmLaHDLUlV/CXNXawokfERzh07IYNAvHGorjqZo2UW1
         98/vYd2ucNn8Xd+YYSRHTEauJ6Xs6gfdxAt0GkAtelzHt86kMiQAHEMs4HepxEXxVShP
         IT91tM/NtbxeyiZxV6EXhVVM35bw28miL0vofJHnN+bGxjyuYUKBVsjN5SLSfEhQ77s2
         xdandcX4aHlDyDRqk+PZ6n0J0SbeebcjgS9qnNetuS4jh7a+Tt0s5uc7jJkTYE3fZ+qZ
         rW3A==
X-Gm-Message-State: AOJu0YxtPNScVOcdsiG3ACkDUTBmG9M2OqS17ltI0iu8dB6KH0bjnXNl
	BMSBlNXBGtL+5LKHoaMQbi2UgMc+aZj0pLuRw0ipdJPUDsTVI6dei4B+DzUdsS1p2SrhBl4IVNr
	p/mhihUcQPf1uqOhigsTEndzzP6z7TrjGLcqVWnkLwaniVkzSJ+TUZ4yvYr0pzcVs
X-Received: by 2002:a05:6512:1254:b0:52c:e133:7b2e with SMTP id 2adb3069b0e04-52edf0195f5mr1288343e87.35.1721131463632;
        Tue, 16 Jul 2024 05:04:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaC8obRk9iqnldIA0DQKWIL9UUAH7IVCkuB5VlJLOkQ94FNfY0spnafv9ICTghpF16KeVn1w==
X-Received: by 2002:a05:6512:1254:b0:52c:e133:7b2e with SMTP id 2adb3069b0e04-52edf0195f5mr1288318e87.35.1721131462920;
        Tue, 16 Jul 2024 05:04:22 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:243:da88:7ff9:68fc:2f43:bcdf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5a3a16sm302816466b.21.2024.07.16.05.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 05:04:22 -0700 (PDT)
Date: Tue, 16 Jul 2024 08:04:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH 9/9] admin: get rid of _ in labels
Message-ID: <20240716080355-mutt-send-email-mst@kernel.org>
References: <1130700f4ae71a93d9887af35cf105731219f057.1721062136.git.mst@redhat.com>
 <3e773fcfd4246e66e6f39d3be95d2c0335e34532.1721062136.git.mst@redhat.com>
 <87y161aix3.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87y161aix3.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 16, 2024 at 09:35:20AM +0200, Cornelia Huck wrote:
> On Mon, Jul 15 2024, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > it's not the 1st time we find out underscores in labels confuse
> > latexdiff machinery when generating html.
> > Errors look like this:
> >
> > ! Missing \endcsname inserted.
> > <to be read again>
> >                    \unhbox
> > ....
> >
> > ?
> > ! Emergency stop.
> > <to be read again>
> >                    \unhbox
> >
> > To fix, convert underscores in labels to dashes.
> >
> 
> Hm... should we add a "Avoid common pitfalls" section to the README?
> Anything else other than avoiding underscores in labels?
> 
> (Not sure if that will help, things like that are easy to miss.)

Some kind of CI checking patches might help.

