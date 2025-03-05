Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BF02505DF
	for <virtio-comment@lists.linux.dev>; Wed,  5 Mar 2025 16:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741191218; cv=none; b=qM1hpiWYZsCw0337fZM6UIJK5P4fpvGnuekkRs58PNezZX/VhyI173a7qgo27IX7vJowyuruqi3wRsC+XImUtr2v4edZTDkSyuKoAiu64c3AeUTZvZyR2vURQ+QbZkbYw190T0sR7QBoJnlJx9mv3hSq3uLkWJ4UwY7dX2dA2+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741191218; c=relaxed/simple;
	bh=EKVa0Gbft9EqgmdROliYU4fG/fjO8KHLSMriOyzqPvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=QDv78BEDcm1KeHzM5EjKFwCH5tQvFulfkVMST1D+KoHW3Rbew8/y5X2UcbAYGpLrqAWZBpGww4aP+oVKIUIzm9XdX9GNE7hxow8GgjINWOR8ktqQb1Ygw8udnsRQbYlIiZ5P2OPjFwg5kEMj0TR/wAeNwUa95TTz/4f/4Wa4FJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C7Qd5Ta6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C7Qd5Ta6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741191215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AxYRNcOxn5CVW8KbAs3gaiv7MLcd68jjkYoRLV5VCnc=;
	b=C7Qd5Ta6+6iHaZaILiGjP8lJUWRui7UFEFP5nNI92qSLno99Vj+2TwL9p31UPfbA55/aLC
	/NjnARI+zQTTF6ZLv9IeAPui5KNTKhXegOlME8tOlgn0a6yHdx8lRHDTubtKPStTWEU/XY
	ct6HgTSqUzHc3ard1/sKtO9YURVDiN8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-rNXz0lgkOKiPkPoHDisbEw-1; Wed, 05 Mar 2025 11:13:23 -0500
X-MC-Unique: rNXz0lgkOKiPkPoHDisbEw-1
X-Mimecast-MFC-AGG-ID: rNXz0lgkOKiPkPoHDisbEw_1741191202
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39101511442so591878f8f.1
        for <virtio-comment@lists.linux.dev>; Wed, 05 Mar 2025 08:13:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741191202; x=1741796002;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AxYRNcOxn5CVW8KbAs3gaiv7MLcd68jjkYoRLV5VCnc=;
        b=usGb1VC0UoWtUMZFx6oXUDEGT+hpWnJgYRaSlMmYCKn0gmAbTGdOEdV4xWr1aCBYsY
         hY/xUYlqvbsfeqPGpsrfcz8bFA9o9Au4bPuZDHCghdiPtPUON592O2qjVqNgy4A0Pmpz
         ilM81aw6DutO8hHm9X92zDK5f+TzWW62zIUL8l3VSbd5nl1/9S/Ws8k9y2XVDIn3QOZ/
         fgxdbK0tvVDKT1QlQDd7uwzph/ALKtJ/Y1q/xNve8GJOzRoTo6t4WbYN3ZKb0hwi0NNI
         bNyJQzt0044k8rMmyqv4CIc2VIT6xd5vt/rufki8bi4D1TH/j3TjZxlYozQtBn/IWYRd
         Oy8A==
X-Gm-Message-State: AOJu0YythteVCKEB9PDzD4hhWg1g0kApArnmk1+aFcDLarRYejLdQyBl
	CSKDUUGmYWiA8tRNX/Bq3aOUTErBxJMRNQMk0RMzxjpttzgSPgmM24ogxPT2mjmXqz+d40B2DQp
	78BefJsqdPEyd8XbMsYHV+sIXmX9/xxPyPVCVn8VhE2QuzqkdrUs4qwB3FquEqHhx
X-Gm-Gg: ASbGncsrC0Yre6m/Ari+cFj/bON0PtyFXbrdHNKzS3VuX3/1eu4Lk9t/jAtS9Srg2Ir
	4YBCS0+9zRKs1Am/UKEbj4hkW9vwtKHK6rNi0wFAPqIwFHScODEGMjlKkNty4zBa/yOYytF7b2H
	dMHkCMmLRaX+KYHrsC0sO3EhK1RFb/kan8QFAEaZboWjlv58wxb+y6lzL+Bj7Y5ebVr43CMMOuE
	U80+q6KabzGLhp2JW2feaBYo8Px1IpyqXs/FTvCgiA/Gf+/33O99+czUHifQxznW8+6eI9RCP/v
	kNnLe2Tn1w==
X-Received: by 2002:a5d:5f51:0:b0:38d:b8fd:591f with SMTP id ffacd0b85a97d-391155f9f2emr6651326f8f.5.1741191202447;
        Wed, 05 Mar 2025 08:13:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBPsEjcCHpj9oXsSqfsllG5T4hEZgpLLorKAgYkgBceR8wZMJfd5BEbMSYXafYOUrPEalimQ==
X-Received: by 2002:a5d:5f51:0:b0:38d:b8fd:591f with SMTP id ffacd0b85a97d-391155f9f2emr6651308f8f.5.1741191202021;
        Wed, 05 Mar 2025 08:13:22 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bcc13b23asm34228945e9.1.2025.03.05.08.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 08:13:21 -0800 (PST)
Date: Wed, 5 Mar 2025 17:13:19 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: virtio-comment@lists.linux.dev, sgarzare@redhat.com
Subject: Re: [PATCH v2] git-publish: add profile
Message-ID: <Z8h4H1FYQWK0BFMN@fedora>
References: <20250305105751.1472050-1-mvaralar@redhat.com>
 <CADSE00LLtG04SHmCp1+DuOsc+E3QqA-BDp=FuhCmAO_uvb_+2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CADSE00LLtG04SHmCp1+DuOsc+E3QqA-BDp=FuhCmAO_uvb_+2g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9eRiMn_x5AUVVau4mI9WSDdPGslb0dE-7wxhcbLQ_Io_1741191202
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Mar 05, 2025 at 02:43:05PM +0100, Albert Esteve wrote:
> On Wed, Mar 5, 2025 at 11:58 AM Matias Ezequiel Vara Larsen
> <mvaralar@redhat.com> wrote:
> >
> > Add git-publish profile and document how to use it.
> >
> > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > ---
> > v1 -> v2:
> >    * add link to git-publish
> >    * document that the project contain a profile already
> > ---
> >  .gitpublish |  3 +++
> >  README.md   | 13 +++++++++++++
> >  2 files changed, 16 insertions(+)
> >  create mode 100644 .gitpublish
> >
> > diff --git a/.gitpublish b/.gitpublish
> > new file mode 100644
> > index 0000000..d412896
> > --- /dev/null
> > +++ b/.gitpublish
> > @@ -0,0 +1,3 @@
> > +[gitpublishprofile "default"]
> > +base = master
> > +to = virtio-comment@lists.linux.dev
> > diff --git a/README.md b/README.md
> > index c06caf6..3df3fb2 100644
> > --- a/README.md
> > +++ b/README.md
> > @@ -110,6 +110,19 @@ git format-patch -o proposal1/ HEAD~1..<br>
> >  git send-email --to=virtio-comment@lists.linux.dev proposal1/0001-*
> >  </code>
> >
> > +<dl>Optionally, you can use
> > +<A
> > +HREF="https://github.com/stefanha/git-publish">git-publish</A> to submit a patch. This project already contains a git-publish's profile that will configure some fields, i.e., To field with the right address. After you have installed git-publish, the procedure is the following:
> 
> Nit: remove uppercase and the line split? Also, you could use acute
> accents surrounding the `To` field, to highlight it in the markdown.
> Also, not sure that the genitive is correct there for `git-publish's
> pofile`. And if you want to give an example, better use `e.g.` instead
> of `i.e.`. So all in all, something like this maybe?
> 
> <a href="https://github.com/stefanha/git-publish">git-publish</a> to
> submit a patch. This project already contains a `git-publish` profile
> that will configure some fields, e.g., `To` field with the right
> address. After you have installed `git-publish`, the procedure is the
> following:
> 

Thanks, I'll send v3 with those changes.

Matias

