Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705BF25A359
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 14:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760105217; cv=none; b=ALfWK01c8IhlMXeEZjLLanHfEOPZGKTzC5/a1Vd5tknZEPR/5/gPbvQSpDfLz1NwZGpEvrd3pfEg10FgMux9Ze8vibrULqane6HsIG0iXQkBx8etOxgum+lZucX2zjsN1ultx1k7JNQvK+eYpBMS6omW8tpWon7R/16meHX7GFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760105217; c=relaxed/simple;
	bh=8MA7FfrH/V6NGdnFtUYtTxv0wldl3XlWU3wc/Vy8Vdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=D/6TwWgGsiyCiWYc0jgwK38Yz1+1J50qXQM0kEy43IUkMtXbgqkh2RNg1cOIHkGKfAct6XkVxv4NiJUOeuMqWNPrvI/cPOWeqW/RIlp3kzs4kmPLvSZ1JhyIzJTB/LXtnke0u0Ly3J5fQheZxyKY1TGzOLF9FwE/0CVBugocn0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CkVr15D4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CkVr15D4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760105214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pSVo34IeORR9SNdenw28PcptNGNfa7COSUlV1v7UHvI=;
	b=CkVr15D4+ctFF57S7dHxICf8axUTVqMi+sfqdSQa3MhVOcrUCetf0Paie5swbM2Iu2WWIt
	BcSsQgM0DIqBh6A/6RhWL/RevLFALMclRlfDRHzjHcO72mzT7o/RqBXLKh6q+Wa17ZatHJ
	r3DB/nZ7+A8qFQHlVj+FYh/R9Lzd7Q0=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-r7Aw70C9O_KfmH3N-mWpuQ-1; Fri, 10 Oct 2025 10:06:52 -0400
X-MC-Unique: r7Aw70C9O_KfmH3N-mWpuQ-1
X-Mimecast-MFC-AGG-ID: r7Aw70C9O_KfmH3N-mWpuQ_1760105212
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7810ead6998so9920447b3.0
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 07:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760105212; x=1760710012;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pSVo34IeORR9SNdenw28PcptNGNfa7COSUlV1v7UHvI=;
        b=oPN/E1McWtPDO/tLr5yqRbPR9dN1HtLUR8C8cEQtFcuxy/nQQWDITec+tfjfip7MkP
         Auni/RjjORqScmnOuu0JlStOV5mDXJZQy1u+PiuRHUwZ6peF4ZEIn1fqWlOpPe9qLRU6
         uFyzumzCryFpOQAwy38/JeoJN+krH1wCHRLIEgy0KUWg+5gFOmher2WXTVnHdlLlwlit
         vDnCo3yQTxhDy3CHkBLAsrsYXBYlreKtvvLRbPaMSruUWrzeKQjjzWCsauuOsXqu/8nj
         IhmMr+Doqqyvp5C9l2qhAKcyuEGrv7M8elyn4ZbdC2748Z/GAbtVKWZOgT0W1bFy2Yaf
         NHSA==
X-Gm-Message-State: AOJu0YwSRe81QfE1np+wHru7PwmOmqaBu4sJEGyP4EP89YlSi9OZdKqZ
	Dq+3XspytcSKSVemSC91qrpQp1h9J/gWD0lDwiDp7auQ3AfWEx4M4Xq+ukmpusyV5BynpxZXvjV
	9/+pLuZO1NxPFHMy84fmA8z+lvaKa9oSsT1QtHPjahONg1fvxgchgJ4XEAsuEHcoFeKtAApIU/M
	RC/jQ=
X-Gm-Gg: ASbGnctbtH1j1uHaL3tmi+cioKza4O1kxgw5b1mV1fnsq7Tu+PDZZ8MblZUfAmGc8gu
	643nceFdMUXXv03fBKk4conWcS0wMbkDnKFuLT6PDqYufpEnMobOsoescHXgWCZgkc7Ea3+ngHd
	vyCH+OnBvO3upr8oK9UsXKI1Dzni0DE3ILNpfT2gvnYVYfd6TPoIO2eHAhGlYQ5+70AdkolWW3K
	D6EdkgxabjIWwxY19X2a2Mmt1lyDM1UCAp+5y3OkQuzzCe4jfjoY4lEBkms/2u49XID+Mhp9m/h
	TWnIAH4LQ7WA0EpQviuINUXFrA5nzw==
X-Received: by 2002:a05:690c:c8e:b0:781:64f:2b5b with SMTP id 00721157ae682-781064f397bmr39821457b3.55.1760105211730;
        Fri, 10 Oct 2025 07:06:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIERqHE0Aws+X3gfTIsKG0EhtkLrCfCeDNT4ctjBhnAquL0Bzd7q8garxd3dTs4/xK1ffOpw==
X-Received: by 2002:a05:690c:c8e:b0:781:64f:2b5b with SMTP id 00721157ae682-781064f397bmr39820717b3.55.1760105211001;
        Fri, 10 Oct 2025 07:06:51 -0700 (PDT)
Received: from redhat.com ([45.88.222.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc347969fsm16882936d6.18.2025.10.10.07.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 07:06:50 -0700 (PDT)
Date: Fri, 10 Oct 2025 10:06:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH v2 10/10] .github: add a runner to build the latest draft
Message-ID: <20251010100110-mutt-send-email-mst@kernel.org>
References: <20251010112010.3880438-1-alex.bennee@linaro.org>
 <20251010112010.3880438-11-alex.bennee@linaro.org>
 <20251010075725-mutt-send-email-mst@kernel.org>
 <87zf9yvowy.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87zf9yvowy.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ri5lfnsGryYYs8pvQZyD3x5dFTOhDIo31wQVwma_zPs_1760105212
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 10, 2025 at 02:58:53PM +0100, Alex Bennée wrote:
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Fri, Oct 10, 2025 at 12:20:10PM +0100, Alex Bennée wrote:
> >> This will run each time anything is pushed to the repository and store
> >> the result in the release assets area of github. To see an example of
> >> it in practice see the virtio-msg repo:
> >> 
> >>   https://github.com/Linaro/virtio-msg-spec/releases
> >
> > Is this the PDF?
> >
> > https://github.com/Linaro/virtio-msg-spec/releases/download/virtio-msg-rfc1-Linaro-draft-v14/virtio-msg-rfc1-Linaro-draft-v14.pdf
> >
> >
> > Some comments:
> > I suggest removing the version (e.g. replace with X.X)
> 
> Isn't the closest version still useful (to know its not based on a
> really old version of the spec)?

Not sure. E.g. in this case this is *before* 1.4 and later one
will maybe be *after* 1.4, and not sure we'll remember to update.
Just worried people will get confused. Not critical I guess...
Maybe stick something else in there to make it clear?  X.1.4 ?

> > Replacing "Working Draft" with just "Draft"
> > Maye stick the hash there too?
> 
> I've gone with:
> 
>   Unofficial Draft (@ git 8c7a1c3 with local changes)
> 
> to make it clear its outside of the normal OASIS stats.

Sounds good. Maybe "ud" in the file name then like we did
for wd?

> > I also see front page corruption:
> > driver listing overlaps with related work.
> 
> I think that predates my changes - I built from current HEAD and it has
> the some overlap.

No, it's another problem with the toolchain used - I built it on latest
fedora and it does not have this issue.

> For the unofficial draft should we just elide the stage information
> entirely as the links it generates don't point anywhere?

I wouldn't bother too much and after all the point is to
speed up development so it's useful to make it look
close to what the official one will look like.

> >
> >
> >
> >
> >
> >
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> Message-ID: <20251008145916.2626143-10-alex.bennee@linaro.org>
> >> ---
> >>  .github/workflows/deploy.yaml | 37 +++++++++++++++++++++++++++++++++++
> >>  .github/workflows/test.yml    | 15 ++++++++++++++
> >>  2 files changed, 52 insertions(+)
> >>  create mode 100644 .github/workflows/deploy.yaml
> >>  create mode 100644 .github/workflows/test.yml
> >> 
> >> diff --git a/.github/workflows/deploy.yaml b/.github/workflows/deploy.yaml
> >> new file mode 100644
> >> index 0000000..fec4910
> >> --- /dev/null
> >> +++ b/.github/workflows/deploy.yaml
> >> @@ -0,0 +1,37 @@
> >> +name: Deploy current state
> >> +
> >> +on: [push]
> >> +
> >> +jobs:
> >> +  build:
> >> +    runs-on: ubuntu-latest
> >> +    steps:
> >> +      - uses: actions/checkout@v4
> >> +      - uses: xu-cheng/texlive-action@v2
> >> +        with:
> >> +          scheme: full
> >> +          run: |
> >> +            apk add file font-liberation make zip
> >> +            make local-all
> >> +            echo ${{ github.sha }} > Release.txt
> >> +
> >> +      - name: Create Draft Release
> >> +        id: create_release
> >> +        uses: actions/create-release@v1
> >> +        env:
> >> +          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
> >> +        with:
> >> +          tag_name: ${{github.ref_name}}-${{ github.repository_owner }}-draft-v${{ github.run_number }}
> >> +          release_name: Draft ${{ github.run_number }}
> >> +          draft: false
> >> +          prerelease: false
> >> +
> >> +      - name: Upload Release Asset
> >> +        uses: actions/upload-release-asset@v1
> >> +        env:
> >> +          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
> >> +        with:
> >> +          upload_url: ${{ steps.create_release.outputs.upload_url }}
> >> +          asset_path: virtio-v1.4-wd01.pdf
> >> +          asset_name: ${{github.ref_name}}-${{ github.repository_owner }}-draft-v${{ github.run_number }}.pdf
> >> +          asset_content_type: application/pdf
> >> diff --git a/.github/workflows/test.yml b/.github/workflows/test.yml
> >> new file mode 100644
> >> index 0000000..34f4f44
> >> --- /dev/null
> >> +++ b/.github/workflows/test.yml
> >> @@ -0,0 +1,15 @@
> >> +name: CI
> >> +
> >> +on: [pull_request]
> >> +
> >> +jobs:
> >> +  build:
> >> +    runs-on: ubuntu-latest
> >> +    steps:
> >> +      - uses: actions/checkout@v4
> >> +      - uses: xu-cheng/texlive-action@v2
> >> +        with:
> >> +          scheme: full
> >> +          run: |
> >> +            apk add file make zip
> >> +            make local-html
> >> -- 
> >> 2.47.3
> >> 
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro

