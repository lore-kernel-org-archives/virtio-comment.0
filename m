Return-Path: <virtio-comment-return-2470-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 62712986279
	for <virtio-comment@lists.oasis-open.org>; Thu, 30 Dec 2021 14:24:48 +0000 (UTC)
From: Max Gurtovoy <mgurtovoy@nvidia.com>
Date: Thu, 30 Dec 2021 14:24:46 +0000
Message-ID: <DM4PR12MB504084D7E95CF5E942867B61DE459@DM4PR12MB5040.namprd12.prod.outlook.com>
References: <20210801124527.35655-1-mgurtovoy@nvidia.com>
 <87sfzhx0h3.fsf@redhat.com> <ed7f44c2-5058-c4ef-e427-d1c83126bc62@nvidia.com>
 <874kbpvkpn.fsf@redhat.com> <20210816103945-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210816103945-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: RE: [virtio-comment] Re: [PATCH 1/1] Fix reserved Feature bits
 numbering
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "stefanha@redhat.com" <stefanha@redhat.com>, "eperezma@redhat.com" <eperezma@redhat.com>, Oren Duer <oren@nvidia.com>, Parav Pandit <parav@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi MST/Cornelia,
Can you please update on the status of this patch ?
It's open for few months and I'm wondering if there is something wrong with=
 it ?

-----Original Message-----
From: Michael S. Tsirkin <mst@redhat.com>=20
Sent: Monday, August 16, 2021 5:40 PM
To: Cornelia Huck <cohuck@redhat.com>
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>; virtio-comment@lists.oasis-open.or=
g; stefanha@redhat.com; eperezma@redhat.com; Oren Duer <oren@nvidia.com>
Subject: Re: [virtio-comment] Re: [PATCH 1/1] Fix reserved Feature bits num=
bering

On Mon, Aug 16, 2021 at 10:48:36AM +0200, Cornelia Huck wrote:
> On Thu, Aug 12 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
>=20
> > On 8/10/2021 9:44 AM, Cornelia Huck wrote:
> >> On Sun, Aug 01 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
> >>
> >>> This should have been updated during VIRTIO_F_NOTIFICATION_DATA=20
> >>> and VIRTIO_F_NOTIF_CONFIG_DATA standartization.
> >>>
> >>> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> >>> ---
> >>>   content.tex | 4 ++--
> >>>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/content.tex b/content.tex index 5c70a3c..e9a32fa=20
> >>> 100644
> >>> --- a/content.tex
> >>> +++ b/content.tex
> >>> @@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities=
 of a Virtio Device / Feature B
> >>>   \begin{description}
> >>>   \item[0 to 23] Feature bits for the specific device type
> >>>  =20
> >>> -\item[24 to 37] Feature bits reserved for extensions to the queue=20
> >>> and
> >>> +\item[24 to 39] Feature bits reserved for extensions to the queue=20
> >>> +and
> >>>     feature negotiation mechanisms
> >> I'm wondering whether we should do s/reserved/used/ here?
> >
> > I'm just fixing a bug here. You can take this patch and create=20
> > another one with the above suggestion on top.
> >
> > I'm ok with your suggestion.
>=20
> So... any opinions on whether this should get a proper vote? [I won't=20
> be able to handle that in the next weeks. Michael?]


Feature bit numbering is an important enough matter that I'd say let's have=
 an issue for this please, and I will do a ballot.

> >
> >>
> >>>  =20
> >>> -\item[38 and above] Feature bits reserved for future extensions.
> >>> +\item[40 and above] Feature bits reserved for future extensions.
> >>>   \end{description}
> >>>  =20
> >>>   \begin{note}


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

