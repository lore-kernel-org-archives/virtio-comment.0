Return-Path: virtio-comment-return-1716-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BE9A8986611
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 Feb 2021 23:46:39 +0000 (UTC)
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Date: Thu, 4 Feb 2021 23:46:35 +0000
Message-ID: <62ed2b8a488341e495a3609730ce377c@intel.com>
References: <20210203111532.69ee4033.cohuck@redhat.com>
	<20210204074600.1926789-1-vivek.kasireddy@intel.com>
 <20210204111625.4700dd1e.cohuck@redhat.com>
In-Reply-To: <20210204111625.4700dd1e.cohuck@redhat.com>
MIME-Version: 1.0
Subject: RE: [virtio-comment] [PATCH] content: Request to reserve device ID 37
 for Dmabuf device
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Kim, Dongwon" <dongwon.kim@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Thank you for the review Cornelia; we'll request a vote soon.

Thanks,
Vivek

> -----Original Message-----
> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Thursday, February 04, 2021 2:16 AM
> To: Kasireddy, Vivek <vivek.kasireddy@intel.com>
> Cc: virtio-comment@lists.oasis-open.org; Kim, Dongwon <dongwon.kim@intel.=
com>
> Subject: Re: [virtio-comment] [PATCH] content: Request to reserve device =
ID 37 for
> Dmabuf device
>=20
> On Wed,  3 Feb 2021 23:46:00 -0800
> Vivek Kasireddy <vivek.kasireddy@intel.com> wrote:
>=20
> > The Dmabuf device can be used to share a dmabuf created in the Guest
> > with the Host.
> >
> > Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> > ---
> >  content.tex | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/content.tex b/content.tex index 1ca24c1..c1ba683 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -2846,6 +2846,8 @@ \chapter{Device Types}\label{sec:Device Types}
> > \hline
> >  35         &   Watchdog \\
> >  \hline
> > +37         &   Dmabuf device \\
> > +\hline
> >  \end{tabular}
> >
> >  Some of the devices above are unspecified by this document,
>=20
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
>=20
> In order to request a vote, please follow the process outlined at https:/=
/github.com/oasis-
> tcs/virtio-spec#use-of-github-issues.


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

