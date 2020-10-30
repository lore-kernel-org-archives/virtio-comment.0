Return-Path: virtio-return-3444-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio@lists.oasis-open.org>
List-Post: <mailto:virtio@lists.oasis-open.org>
List-Help: <mailto:virtio-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-subscribe@lists.oasis-open.org>
References: <20201030061222-mutt-send-email-mst@kernel.org>
 <20201030102339.GB3046@work-vm>
 <2b6a81de-089d-aaad-7c74-78b6f534164e@siemens.com>
 <20201030131645.3f1ce61e.cohuck@redhat.com>
From: Mihai Carabas <mihai.carabas@oracle.com>
Message-ID: <04685a95-e27c-1280-02dd-15cb91d80f98@oracle.com>
Date: Fri, 30 Oct 2020 15:51:21 +0200
MIME-Version: 1.0
In-Reply-To: <20201030131645.3f1ce61e.cohuck@redhat.com>
Subject: Re: [virtio] Re: [virtio-comment] allocating device IDs without a
 vote
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Cornelia Huck <cohuck@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On 10/30/2020 2:16 PM, Cornelia Huck wrote:
> On Fri, 30 Oct 2020 11:30:09 +0100
> Jan Kiszka <jan.kiszka@siemens.com> wrote:
> 
>> On 30.10.20 11:23, Dr. David Alan Gilbert wrote:
>>> * Michael S. Tsirkin (mst@redhat.com) wrote:
>>>> At the Virtio BoF at the virtual KVM forum, 2020, a recurring theme was
>>>> the difficulty contributors face in obtaining device IDs for new
>>>> devices. As allocating a new ID is a technicality, and can not break
>>>> existing devices, it does not sound too bad to skip a voting step in
>>>> that process.
>>>
>>> It would seem reasonable to define what the expectations, if any are,
>>> about the use of those IDs:
>>>
>>> Is it expected that the allocator of such an ID would eventually
>>> end a request to merge a spec for the device, or are they free
>>> not to?
>>>
>>> If merging is expected, then is it acceptable to recycle IDs that have
>>> not been defined after n-Years.
>>>    
>>
>> Lowering the barrier for grabbing IDs too much and not establishing a
>> garbage collection mechanism can eventually shoot back, IMHO.
> 
> Maybe we really need two things:
> 
> - a "private" range, that anyone can use for playing etc.
> - an easy way to request an ID, combined with some kind of garbage
>    collection
> 
> We currently do have some IDs without a spec, but we really need to
> keep some of them reserved, as there are already (sometimes legacy)
> devices out there.
> 
> Perhaps there needs to be some kind of annotation? If you reserve an ID
> via the quick mechanism, it gets a "reserved until YYYY-MM-DD", and
> that tag gets removed when a proper spec is merged? For
> "in-the-wild-do-not-reuse" IDs, we'd still require a vote, as the
> default should be to have a proper spec if you want something outside
> of the private namespace.

I agree with Cornelia and Jan.

Thank you,
Mihai Carabas

---------------------------------------------------------------------
To unsubscribe from this mail list, you must leave the OASIS TC that 
generates this mail.  Follow this link to all your TCs in OASIS at:
https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php 

