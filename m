Return-Path: <mst@redhat.com>
Date: Tue, 9 Aug 2022 17:03:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [virtio-comment] [PATCH V3 RESEND 1/4] Introduce virito
 transport virtqueue
Message-ID: <20220809165737-mutt-send-email-mst@kernel.org>
References: <20220805095343.486546-1-lingshan.zhu@intel.com>
 <20220805095343.486546-2-lingshan.zhu@intel.com>
 <CACGkMEt7uCOKrnxJMBMFbRtKicH42eHPBOuODao33XCEvRY=Ow@mail.gmail.com>
 <1f82b84c-db9d-69c1-6a41-a4573036ce0c@intel.com>
 <20220809050941-mutt-send-email-mst@kernel.org>
 <CACGkMEuSyd57Gg+DbC=Fv_fR8nXMHtAvWrNc0p_c=kht2NP-Tw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEuSyd57Gg+DbC=Fv_fR8nXMHtAvWrNc0p_c=kht2NP-Tw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, Cornelia Huck <cohuck@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, nrupal.jani@intel.com, "Uminski, Piotr" <Piotr.Uminski@intel.com>, hang.yuan@intel.com, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Aug 09, 2022 at 05:28:33PM +0800, Jason Wang wrote:
> On Tue, Aug 9, 2022 at 5:12 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Aug 09, 2022 at 04:36:43PM +0800, Zhu, Lingshan wrote:
> > > > > +
> > > > > +A device that offers feature bit VIRTIO_F_TRANSPT_VQ and a transport virtqueue is a management device.
> > > > > +It processes the commands through the transport virtqueue commands.
> > > > I think we need to be verbose here, e.g what did those transport
> > > > virtqueue commands do? What's the relationship between management
> > > > device and managed device?
> > > I will add an overview of the transport virtqueue commands here, and a
> > > description of the relationship in the "managed device" section.
> >
> > Transport is fine but management of devices is clearly something
> > nvidia's patches do. So I think it's best to reuse the concept of device
> > groups for this, from Max's patchset. Let's not replicate that work at
> > least. I promised Max to help a bit with wording so I'll soon send a
> > revision of his patchset, the generic part about device group
> > from which you should be able to reuse.
> 
> I wonder if "parent/child" makes any more sense than "management/managed" here?
> 
> Thanks

I suggest reusing Max's proposal.
There we have a group, a group type, we have a group member.
All that is left is a name for a device that owns the vq
through which the commands are sent (PF for the SRIOV group).
Group parent might be ok, sure. Group owner as another option?


> >
> > --
> > MST
> >
> 
> 
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
> 
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
> 
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/

