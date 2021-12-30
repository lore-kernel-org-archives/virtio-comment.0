Return-Path: <mst@redhat.com>
Date: Thu, 30 Dec 2021 09:27:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [virtio-comment] Re: [PATCH 1/1] Fix reserved Feature bits
 numbering
Message-ID: <20211230092641-mutt-send-email-mst@kernel.org>
References: <20210801124527.35655-1-mgurtovoy@nvidia.com>
 <87sfzhx0h3.fsf@redhat.com>
 <ed7f44c2-5058-c4ef-e427-d1c83126bc62@nvidia.com>
 <874kbpvkpn.fsf@redhat.com>
 <20210816103945-mutt-send-email-mst@kernel.org>
 <DM4PR12MB504084D7E95CF5E942867B61DE459@DM4PR12MB5040.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM4PR12MB504084D7E95CF5E942867B61DE459@DM4PR12MB5040.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Cc: Cornelia Huck <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "stefanha@redhat.com" <stefanha@redhat.com>, "eperezma@redhat.com" <eperezma@redhat.com>, Oren Duer <oren@nvidia.com>, Parav Pandit <parav@nvidia.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On Thu, Dec 30, 2021 at 02:24:46PM +0000, Max Gurtovoy wrote:
> Hi MST/Cornelia,
> Can you please update on the status of this patch ?
> It's open for few months and I'm wondering if there is something wrong with it ?

Hmm. Is there a git issue for this?

> 
> -----Original Message-----
> From: Michael S. Tsirkin <mst@redhat.com> 
> Sent: Monday, August 16, 2021 5:40 PM
> To: Cornelia Huck <cohuck@redhat.com>
> Cc: Max Gurtovoy <mgurtovoy@nvidia.com>; virtio-comment@lists.oasis-open.org; stefanha@redhat.com; eperezma@redhat.com; Oren Duer <oren@nvidia.com>
> Subject: Re: [virtio-comment] Re: [PATCH 1/1] Fix reserved Feature bits numbering
> 
> On Mon, Aug 16, 2021 at 10:48:36AM +0200, Cornelia Huck wrote:
> > On Thu, Aug 12 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
> > 
> > > On 8/10/2021 9:44 AM, Cornelia Huck wrote:
> > >> On Sun, Aug 01 2021, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
> > >>
> > >>> This should have been updated during VIRTIO_F_NOTIFICATION_DATA 
> > >>> and VIRTIO_F_NOTIF_CONFIG_DATA standartization.
> > >>>
> > >>> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> > >>> ---
> > >>>   content.tex | 4 ++--
> > >>>   1 file changed, 2 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git a/content.tex b/content.tex index 5c70a3c..e9a32fa 
> > >>> 100644
> > >>> --- a/content.tex
> > >>> +++ b/content.tex
> > >>> @@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
> > >>>   \begin{description}
> > >>>   \item[0 to 23] Feature bits for the specific device type
> > >>>   
> > >>> -\item[24 to 37] Feature bits reserved for extensions to the queue 
> > >>> and
> > >>> +\item[24 to 39] Feature bits reserved for extensions to the queue 
> > >>> +and
> > >>>     feature negotiation mechanisms
> > >> I'm wondering whether we should do s/reserved/used/ here?
> > >
> > > I'm just fixing a bug here. You can take this patch and create 
> > > another one with the above suggestion on top.
> > >
> > > I'm ok with your suggestion.
> > 
> > So... any opinions on whether this should get a proper vote? [I won't 
> > be able to handle that in the next weeks. Michael?]
> 
> 
> Feature bit numbering is an important enough matter that I'd say let's have an issue for this please, and I will do a ballot.
> 
> > >
> > >>
> > >>>   
> > >>> -\item[38 and above] Feature bits reserved for future extensions.
> > >>> +\item[40 and above] Feature bits reserved for future extensions.
> > >>>   \end{description}
> > >>>   
> > >>>   \begin{note}

