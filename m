Return-Path: <virtio-comment-return-7741-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AD2CDB474
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 21:11:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0AC2D866A9
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 21:11:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DF935986831
	for <virtio-comment@archiver.kernel.org>; Mon, 16 Oct 2023 21:11:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C55B198643F; Mon, 16 Oct 2023 21:11:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B53DF98682E
	for <virtio-comment@lists.oasis-open.org>; Mon, 16 Oct 2023 21:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6rtVndXGLu1UcvxL/hB18WJDS2Z5vnlWjJjcdq8+WcZXnElsyeq13uOUNL3XeKpGc/NPeshtV3pBl1fKMm4pBtJMYOOIVt9qBx/b88Ui29/YcXrPYiI/frRFroF8duV3OfZrONIGCZQIb6mMjUz84Gd8Yj3TA/lMewviqHfGwI25YEzRxs95k9eBpU4oo5d/7cPvbLHvyeaJwsKlyqdKaWuBsW0oC8ij5HQ1AaxQM/+7YiyEKm/419xyTh5Bt+n6WHjrH1M2lg/ij2Kvy+zH+W21g4DN+tfgSxluxSIn/+1Ffy2Mo8fzPN3D5/WMj799CbZWEf8t9QK9tKXyMRMTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhWHMbWHa4MDtoRupxDCbXoA1i7G/dOK0LkanfdV9dY=;
 b=nGpXtJvssVq9EpAibMWfShIEXvg1UtEQfrmpQEdxfnhlG1mGc7jw9i9I+I/ympweInXHv25JGbjC6V/RMJrKfCQvIIjGp1rHLwDOr0K7Lj2O3XnXSOCix8T7Nv761ljR7ahOKeFsPHQq7R1WAVtVvyHuaJe9VVblfisVF35j9wg4LGMgG3XgN1kaftPkCBS2s9lX7lTaoOfeiyaEAqSxJELvfMtt5oCXzdzn1O7cj1+BpKEd48FhfCvwc5io40seA1Jyq+mXjqpswbLcnPlP+2BR6O4ikImYo54ztAL28uCDAgxa3g4PC+3Skwlp5sA+uMRQ0tJPUr67YsXq+Nc0zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
From: Satananda Burla <sburla@marvell.com>
To: Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>,
        "mst@redhat.com" <mst@redhat.com>,
        "cohuck@redhat.com" <cohuck@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>,
        "si-wei.liu@oracle.com"
	<si-wei.liu@oracle.com>,
        "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>,
        Heng Qi <hengqi@linux.alibaba.com>
Thread-Topic: [EXT] [PATCH v1 2/7] virtio-net: Add flow filter capabilities
 read commands
Thread-Index: AQHZ+N1JLOJqXG++dEaY885Eol33c7BLervggAExEACAAESkcA==
Date: Mon, 16 Oct 2023 21:11:48 +0000
Message-ID: 
 <SJ0PR18MB44777BF592E56DFF13D42E9BC3D7A@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20231007051443.460148-1-parav@nvidia.com>
 <20231007051443.460148-3-parav@nvidia.com>
 <SJ0PR18MB447755CDD327B238B8013B11C3D0A@SJ0PR18MB4477.namprd18.prod.outlook.com>
 <PH0PR12MB54812CAA944A5F3EA750A590DCD7A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: 
 <PH0PR12MB54812CAA944A5F3EA750A590DCD7A@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|DM4PR18MB5452:EE_
x-ms-office365-filtering-correlation-id: 488f9629-fde9-477f-24fa-08dbce8c8257
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vH+Gp0CqD5D5RkiKbr96ah4QVX08AGduNxbG1WQYraEJbQEhvMyON8SGiWvBaKMeUFG0Pecl3cIZFB+gBOYva3FgyN6lODv2buKjz1hHLOslAifeVxLjgtf+LD4eo7o/LH3er2FjS61hwZcuU6aecOXlu6poTujstLk60P56eEPIjL6cT2HXBm6R5CmGhFN+xdjjfnWX1gCVd/F8ne6y1+6wMi6pQnjm7/ClCDC5SHbYya/AwtBQB2e1FNQnIyNHo9YJNZ8Vb3OhytYYt19jQ+kosQC9G7E3z8N7izBBZ1O86HwH9DYZig4GTvz2UJTUt1AQuAHLFzSEjvkaQCtMmOLdXjq2Q64txPU6KE48vaEtD1xpU3s3QhNaEPklVIw2B6id2T4UifNkv0L+65qev+9WcRYH9EQ5SDoXpZU/aU1RqXW+dJpMtPhx+ZmGaD+VlMhjjzdAQXxSMzNsl9Md3YrBK41rd+YMrqgwUv/SvcMG2SNEsIdbArQRQdAMDn4ZkA7yq6FKfBq7sr1neeId58vlvhlgjVDCBUvyrtwrKUlQBYyoI4E8J9RgKmPObrzaphviIH+YIztDydy0KlNI/B89WJD2+evUHB6P6JKeQUfVZyWJp5RbITIOekKaPilk
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(366004)(346002)(396003)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(53546011)(6506007)(7696005)(55016003)(5660300002)(71200400001)(52536014)(2906002)(26005)(83380400001)(33656002)(122000001)(38070700005)(38100700002)(86362001)(9686003)(41300700001)(316002)(66476007)(110136005)(66946007)(54906003)(64756008)(66556008)(76116006)(8676002)(4326008)(66446008)(8936002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?5Fbds5V4GPWZWBqjeNdFDWfNGSuNLaAX0sYApKidZkgei2SOwQVQq42EyP2l?=
 =?us-ascii?Q?ozNUfkpK30kTn50sHNTiZG2SvuffpHLtL8GSHOvDha8GQWnaeyHExEzJgrQg?=
 =?us-ascii?Q?oNr7WVvufbOOfJcvSzKLUAT+PC47jMugrsQXuuwa/A68BA0I0AfPrCLw93vu?=
 =?us-ascii?Q?92/Lh7JamhLyFaFouDN885+JIo0RbUdD9+BKu1zjl07rlgVIHq+mggxBscjI?=
 =?us-ascii?Q?r3IYxA2NCp7gS99PNaKb9VEy6AmP7fdrSxz7GUy2qg6WyEsRIFVesBS6oef3?=
 =?us-ascii?Q?0VJho5bSJk4Adz6GRDJhTjLAy68HXopylYgoIHwHOX7t3t6r/3vcwR2qXdtJ?=
 =?us-ascii?Q?aaIGUOhDjZp9DRRP253Ut6F77dSuNk66p1wqQCIBlv4IciDlL2mtc6azPBZs?=
 =?us-ascii?Q?cuPYNJpnz8f6upeEv/LS14xC7d5HDdqAyQKUyvfkvLmQiYsEciMeBFixHaiN?=
 =?us-ascii?Q?4ffFzzUGNUKiPk456zaqd/KJp/M3fbFRTRlGT8Ab9lrtlsYy3K2piDp/AWUe?=
 =?us-ascii?Q?7InlRHdgxy32kJ9rzw0bT0GvbZNy8uoSVGdbYGUGe0aHsTNSUuXpZtCzxtTJ?=
 =?us-ascii?Q?8cbmtwKGhEy/p6Nxx/khao1lTWYqhufGMiKzv3KZUn58rPFbl0oGZN2+UrJd?=
 =?us-ascii?Q?cBMVlegJ6TG7i4ZX8imhXXlmlVTIjUPWs1yh+ymGOKMSaCoJzpAnqMOby+vY?=
 =?us-ascii?Q?1lE19bXEb4hSsZzNEkK8suJJGzAjji0Aj35isEE3JN/EgwxVJB6b6yDhZLN7?=
 =?us-ascii?Q?UURY0yL2vAfdaSanja1VXnkVAipsPp9kw/kR5Dvp3RHOmKg6Ed5c35+W8cS9?=
 =?us-ascii?Q?eYMLZG9+xjjNzaTsN05vjw3AX0h5Z92+xCt0T74KgHKhwQv6AmHm4irJRiIB?=
 =?us-ascii?Q?/PkjbkkuBYpcrRoRLS0KYRLj7aN31sua1laMNjfqeeCoHpdzfU/IxbBNSzd5?=
 =?us-ascii?Q?d1r2pxKlbPqKhOA14a+OjVkeg5GJk5gerniexMES+fYI07mS6JSeZwgKfvBh?=
 =?us-ascii?Q?A6h3F4Tpy8Acb8iR/EfvNr0QInhtA8qfItkYKndBPMXWDKkChPUm5duJdPR1?=
 =?us-ascii?Q?vVTBhQNkOYh4fyuHORCn/MmwA60WerkYN2U1rMcLdFtdh5bQWwDEHK1hqPqX?=
 =?us-ascii?Q?kakKsmhY8F9BbVrsqHLbIsf+ZPL942j3SpQ/xAOuOTI9KNyLdRo2fEyFfG2w?=
 =?us-ascii?Q?u9RMTNHRpNcvUpUekbiKBX+pUYO7OKmNMPmaAnGYdWTWejHFQCcnPCmtrJ0W?=
 =?us-ascii?Q?1yRISv3EZd+Mdov/fif0MeWdWOBqqdVscWPPuTAukI0KqFLhbJFoHhfBCfME?=
 =?us-ascii?Q?CbD7IOh2eYjNferj9RZIYQPihPShmu++SYZPw/qs6PW5+B5Cj9i1l8OXNhkz?=
 =?us-ascii?Q?HMN595KABziA2LZq0WX6bxE7nahRvu/oKH78G8YFK/6vL6+3aFW9UuPBfUM7?=
 =?us-ascii?Q?+7OoYzPGYtDlrz6+Toaj+G4G76YXLyi9cfOi8hAFxYFyn412fSbR/6+BbqDJ?=
 =?us-ascii?Q?M+nGBLNL6hMKjO6d0j82luxkjxB3eDzTcCw6hfIk89sDGAQiA/XrToPpjb1b?=
 =?us-ascii?Q?yWDDUTUwKFhzPrKsxJIDKt+ljdGpm/LJ9hHTnTuD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4477.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 488f9629-fde9-477f-24fa-08dbce8c8257
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2023 21:11:48.0541
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vznGKHek4yFN32NYT9qyvlPj3eBaJx//bHKZgtPoiHK1nw3je+8QSY5ZlG4AAq0ib70t1YjbyYIM7YRjx2uMsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR18MB5452
X-Proofpoint-GUID: dm3lPzs3sc9sgRdXUdc2LWcCX3_VQyGw
X-Proofpoint-ORIG-GUID: mSN74EWO4vkvIWt94hcQZsya5NBGO3tE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_10,2023-10-12_01,2023-05-22_02
Subject: [virtio-comment] RE: [EXT] [PATCH v1 2/7] virtio-net: Add flow filter capabilities
 read commands



> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Monday, October 16, 2023 9:35 AM
> To: Satananda Burla <sburla@marvell.com>; virtio-comment@lists.oasis-
> open.org; mst@redhat.com; cohuck@redhat.com
> Cc: Shahaf Shuler <shahafs@nvidia.com>; si-wei.liu@oracle.com;
> xuanzhuo@linux.alibaba.com; Heng Qi <hengqi@linux.alibaba.com>
> Subject: RE: [EXT] [PATCH v1 2/7] virtio-net: Add flow filter capabilitie=
s
> read commands
>=20
>=20
>=20
> > From: Satananda Burla <sburla@marvell.com>
> > Sent: Monday, October 16, 2023 5:10 AM
> >
> > Hi Parav
> >
> > > +For the \field{type} of VIRTIO_NET_FF_ETH_HDR, header fields are
> > > +represented by a bitmap in \field{fields_bmap} are following:
> > > +
> > > +\begin{tabular}{|l|l|l|}
> > > +\hline
> > > +Bit & Name & Description \\
> > > +\hline \hline
> > > +0   & VIRTIO_NET_FF_DST_MAC & Destination MAC address in the packet
> \\
> > > +\hline
> > > +1   & VIRTIO_NET_FF_SRC_MAC & Source MAC address in the packet \\
> > > +\hline
> > > +2   & VIRTIO_NET_FF_ETHER_TYPE & Ether type in the packet \\
> > > +\hline
> > > +\end{tabular}
> > How about vlan ? if a filter selects ETHER_TYPE as vlan (0x8100), How t=
o
> then
> > match the vlanid ? I believe I mentioned this in last series as well.
>=20
> I am sorry, I noticed now that I missed this comment in v0.
> For VLAN, we need to add a new filter as FF_ETH_VLAN, that has implicit
> type of 0x8100, and match field, mask to have the value.
> Shall we can do incrementally as new type?
Yes but it is better to at least add the enum for the type now or leave
enough spacing between L2 and L3 types so that we don't have
to add those types later out of order. For instance, in encoding the type
field, we could leave first 4 bits(16 values) for L2 FF types and start=20
start L3 FF types from 0x10 and so on. I can foresee similar issues with
L2 MPLS label matching, IPV4 extension headers, IPV6 extension headers etc.

Regards
Satananda



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

