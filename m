Return-Path: <virtio-comment-return-8594-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AFEC61D97
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 05:53:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 469D2429A4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 05:53:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 157F69868B0
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 05:53:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E705E9862D9; Fri, 24 Nov 2023 05:53:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D6C439868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 05:53:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KpAUW+mQzoqxMvM3IGoQiFhcXgzQ7FY71zgthXFddMhCYtGinC8Y+hpgMcuYiUJrOaoG6lG6QKIdJBv6ISQz+S+bDjNHDsMprjMNvY69LMv9F0pXkgultJpS2zPs2U7WBzrj6J5Vf6PBbr6VRxOUCIFkurLKZn32Pikvf91sbKorQQzndt0U4mNyUpbCxjM/rsFQqJZNNeRxiNNdg91KwDISAsCrrwd9SCNqQsYV65x2mSsoEYpCgomAJ2afPEf3AHdyr23Zlo8jJ8jwiM/rU2HdNBqnenQdDGhh7lFuIfxjN65S1yUzLC5LA4OWI8MtFU+4IBIVOvmqvcZJEvUBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J14BPuSSu0QDAd2OYaab24wjJug3+XK8vhu5IggtHsk=;
 b=cWTMbSF5lRzVnInVAGD4HIBoWv5Cc1ZZiEohfuwuirLGy7LGZAxlMZsVWXthlDwkXpopQu35+9/RskWudvhW0Xk0Smlj/sviqrMjGnCj+VHoYtd6ce033N9JxrdOzjEHE1+9pxgVQSixLjSGA2JE6JOF7XG6vMGfXRoI04AUWLN/i6Jpzn5bk3xvInf9WcrnktwpyhGXZF+X92JYLOsd8dYoSyL5u+Ab/0+HaIMp4cKvV9bTipfXWa+rgT1Xyw8lLZN0c3OKAoeSv9WjmfA15BdKrtnuMh06TrNUN6aYDXf+6fniwIWzgKBRE8OFFEKw9ifLSbmLr+bewcsRg/2HkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Heng Qi
	<hengqi@linux.alibaba.com>
Thread-Topic: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands
Thread-Index:
 AQHaE9L2DjdkCoB6dUewtbJsrpd4HbCGcWKAgAAAe3CAAA00AIACb1eAgAAZSACAAAMmQA==
Date: Fri, 24 Nov 2023 05:53:02 +0000
Message-ID:
 <PH0PR12MB5481E538B7BBFB907CC6BBE1DCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231110123853.2093309-1-parav@nvidia.com>
 <20231110123853.2093309-3-parav@nvidia.com>
 <20231122084105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org>
 <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <20231124003129-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231124003129-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SN7PR12MB6713:EE_
x-ms-office365-filtering-correlation-id: b1aaacc4-70af-4319-11fd-08dbecb19f12
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 v92bGSqk1+kk5szHaXh1vTO2LrfcV7lEN2IKMD0+LKdowTvWSSI1KGFLGWXcLq2ch2Snx065Z0nRxhWVL5fJAh6oZTVeo4hvQtQQz1IWNPpAQONqWVu+9TzxBfIegGOw1485OFSn5n27hj/BvD9usFsRT7yo5UsZRqn33vEX2AD4/amThpxvJHAXSLRfm9uMhMtlsSJ4wKdV6B/WEcrtZATHuGwN5A6HmwfUfW7+zBsJ/BsT18LlM53etQAnaJWD8MrtJywtasrhoTAjW5rJ9AbUTfus4XxVqRNgQ7D9L6jVqC6+fPfxUPEdgaWH6gKnZ98pNq9dgGdcqcY9LdgHj0yZnckJRjJkKbU02QTpKpUy2z4kYVyZx+0ILMOuDnLGAKICJbar7ssURV6X2rJSxOzq0x4wE6RoPFfNNQKwYfuorZg+J4+VEgUCgJni0JOACm/PGk1I3gP8ZL47NtNm3EGwOGRG+eIFlHFrQBDR7mSPQUqzLIwmDxiaYfBDpnnEQ0jNmZBp8VO004im2t8alCDXijqk1PT2isB8IqO/OTOEJZjJIdnAKMKl955DbMIrgD+l+XANWcKBPpMKVYUEYqhFL6/kZuZoG1JrM6+xU686wSiZEVyRZ56yjmk3aylxDiGXNi9jwQfS7eX+/N+n+aeVvbBTzR/zFS1CNR7zNKcbQWoOOvqvHo02hiH+jXiK
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(39860400002)(346002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38100700002)(86362001)(33656002)(38070700009)(122000001)(316002)(8676002)(8936002)(54906003)(76116006)(4326008)(64756008)(66446008)(66946007)(41300700001)(66476007)(66556008)(55016003)(110136005)(5660300002)(52536014)(19627235002)(2906002)(26005)(9686003)(5930299018)(478600001)(71200400001)(6506007)(7696005)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8l3XN1FPPpUbvpNJaD+AI4V2kzCwcrPUGtT1jpBnHpaeJ9oeJLJWnxLvBejs?=
 =?us-ascii?Q?Q8dWo9IlfTyuoYPH5V35bgKbTrSaUwFe4eX4besc7wVQ/l1nJIxXFNxsHLU1?=
 =?us-ascii?Q?xHt9hkLu2Lipsf92iuju/ibM7VCv+elhvQ2TPVpb48C98F5+CvnVH61xuTwd?=
 =?us-ascii?Q?/VuLCdsrqOZ3xefBgDLcwuuLTi+c59mZMQ9eT9XniWgpwj6ZW8DqGN9GGy2q?=
 =?us-ascii?Q?rNsJKsW5RdvX//X//1sp/Gf/Sn+YAzduAP40ybF9xhSbRLvw4+lgZs/Z0VWj?=
 =?us-ascii?Q?luYMZy1MecOZbSIgghymfSXbDyjPOkmQD2LXGFU5n0sLYccrnLoh55kfpgHV?=
 =?us-ascii?Q?mv7b97F24DCumj45SegjuG+yFKmTdEWIsi0Drt4l4mJdc8zzjrgZVlv4oRU7?=
 =?us-ascii?Q?4ft/xM9OO0sE2aXjaQi/fd8/+JCK46xtcVqcqiUr4m5lbwD68NnZMbRosOq+?=
 =?us-ascii?Q?JCAkGv2dVUuN4qgY8U367WVfnO57meJgcE8o8XUXwZhs4h6kW7itn4GnZWxg?=
 =?us-ascii?Q?bPAObouX8StvzzImtrqTtHNzJD1FKrVug04+BYSFg+5qH7PmkkYfMk1BSVnD?=
 =?us-ascii?Q?WMcqw/bGlbWEgGlLICiyr/+9MG4qp4OBktKi+ug+jwNd7w2IijUY0Y6foFPE?=
 =?us-ascii?Q?nFmfe5Hh/QGLTGA56T1g/uCHzNNXsrczgieRhh8vrsMqyTGU1S7nSwxGqEfV?=
 =?us-ascii?Q?I1UEzYPwAI4ebYX5js2QQU1LMeCF7BIBaVXarIgQcWyA4iWvXKgQyPJDbovk?=
 =?us-ascii?Q?MkFU3sUbQhWjvEqgg4LJyAAjBTV9UcRKUCu+hQNHv6kL4KsCxz/sfxvYEwz5?=
 =?us-ascii?Q?DkbbV9JogC/W4At9h/KAKkvNndy8BhcWHfQaHdp8Z/IW1BSwOVuV0gR6PEnH?=
 =?us-ascii?Q?ESihY2cQwHVTMDM+EYOHq/MKc/SknsJrqo7kpDNarT9z6HK1/7ewT/v/53Yw?=
 =?us-ascii?Q?G37bEeEKFP0Gr4WBI3VOITkAB5Tidd6kYFin9cBAhaup1j9xfks6ptaP1YM6?=
 =?us-ascii?Q?k0a/72+lZnCJ6WRXC2WP9RKAh5RkWBfi5+GQcucSiDkK4XLPwuN533OqiXZo?=
 =?us-ascii?Q?7NlN8yPT/xGZteEWCs2dTeA38r4IIbFNk/Qt1vdqJlKCQCInKSb0FW83pCM/?=
 =?us-ascii?Q?fR6nyingWmxPXGDjxmkWZg/v69nKhZZcPFI0BY6HdJdKNoHbxpAxYGUhD/LX?=
 =?us-ascii?Q?1nK7ZVTx1Rj2f2tRCWmKZeYjvLeYn4VJF/PoLkOUeQm5aWuGQzBLp386gd7Z?=
 =?us-ascii?Q?N9p9zHfj94qS/rDve18nMoMKIMR+xp3pcHwI5Du8zGh4zK2y+W3nkdyroIP6?=
 =?us-ascii?Q?JWyMvZshiG4EQE3LdwWmV5f706Rhxt7MwDxLwBOUk0xZzi7xkjQj5sVt2Q0B?=
 =?us-ascii?Q?A7kibQfqAEWmwSgU0P0iTmORfjyqTFYnsN0i4RQMvdzMCluwBBENCoD1kJWT?=
 =?us-ascii?Q?gOi5l+vl/e2P96AxlYvdiY3qoYF3i/B3r74JXz8sj2VYXlgVaQdj0TIKvfKV?=
 =?us-ascii?Q?4LE/cxtHl7VoC7lmtUChXHeII6V4/dY/v/fyCigVHD+GE93JEfQKQ+JHIbaC?=
 =?us-ascii?Q?r3UWxLE6aq33CyHd/hY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1aaacc4-70af-4319-11fd-08dbecb19f12
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 05:53:02.4770
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5opvqiChDpDHNRaQw3w8iX4g332B2dke+oYkzK1PzlvVR082jEhiJVB3TQC2FWyUse+yY/L0lg5QBebl47uphg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6713
Subject: RE: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, November 24, 2023 11:03 AM
>=20
> On Fri, Nov 24, 2023 at 12:02:23PM +0800, Jason Wang wrote:
> > > > I won't be able to absorb this comment of DMA interface.
> > > > If I discuss further, I will repeat the whole document [1] and I wi=
ll avoid
> that now.
> > > >
> > > > [1]
> > > > https://docs.google.com/document/d/1Iyn-
> l3Nm0yls3pZaul4lZiVj8x1s73
> > > > Ed6rOsmn6LfXc/edit#heading=3Dh.qexbtyc2jpwr
> > >
> > >
> > > I really worry about how provisioning will work. And I do not at all
> > > cherish replicating all of these query capability commands for provis=
ioning.
> >
> > +1
> >
> > There's nothing that prevents the config space from being implemented
> > in a way other than registers.
>=20
> Care doing it finally? Let's see if what Parav is worrying about is then
> addressed.

The whole concept that everything must be in one giant config space is just=
 simply bad.
It does not exist either in virtio spec today.

once can see that what is presented in the commands cannot be placed in con=
fig space at dynamic location.
Same was the case with statistics too.
Same was the case with VQ coaleasing knobs.
Same with hash knobs.
With flow filters,
With rss contexts
With rtc
With new queues creation apis.

The endless list continues...

And reserving bits for future (for other than pad bytes) for future additio=
n in config space is equally not elegant design.
Bits will get spread out at random location making things even harder to ma=
intain.

The device is no longer a simple mac_addr + N queues device with some stati=
c rss config anymore.

With all modern work, every capability query and run time configuration is =
done over cvq interface today.
Single get/set channel from driver to device all using existing resources.

The real hw device also does not need to refer to two places of config and =
cvq when serving cvq commands.
Oh, the list of advantages just continues with what 1.3 spec has done.


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
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

